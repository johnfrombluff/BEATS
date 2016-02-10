mygetDescriptionStatsBy <- function (x, by, digits = 1, html = TRUE, numbers_first = TRUE,
          statistics = FALSE, statistics.sig_lim = 10^-4, statistics.two_dec_lim = 10^-2,
          useNA = c("ifany", "no", "always"), useNA.digits = digits,
          continuous_fn = describeMean, prop_fn = describeProp, factor_fn = describeFactors,
          show_all_values = FALSE, hrzl_prop = FALSE, add_total_col,
          total_col_show_perc = TRUE, use_units = FALSE, default_ref,
          NEJMstyle = FALSE, percentage_sign = TRUE, header_count,
          ...)
{
  API_changes <- c(show_missing_digits = "show_missing.digits",
                   show_missing = "useNA", sig.limit = "statistics.sig_lim",
                   two_dec.limit = "statistics.two_dec_lim")
  dots <- list(...)
  fenv <- environment()
  for (i in 1:length(API_changes)) {
    old_name <- names(API_changes)[i]
    new_name <- API_changes[i]
    if (old_name %in% names(dots)) {
      if (class(fenv[[new_name]]) == "name") {
        fenv[[new_name]] <- dots[[old_name]]
        dots[[old_name]] <- NULL
        warning("Deprecated: '", old_name, "'", " argument is now '",
                new_name, "'", " as of ver. 1.0")
      }
      else {
        stop("You have set both the old parameter name: '",
             old_name, "'", " and the new parameter name: '",
             new_name, "'.")
      }
    }
  }
  useNA <- match.arg(useNA)
  if (is.list(statistics) || (statistics != FALSE && !is.function(statistics))) {
    if (is.list(statistics)) {
      types <- c("continuous", "proportion", "factor")
      if (any(!names(statistics) %in% types))
        stop("If you want to provide custom functions for generating statistics",
             " you must either provide a function or a list with the elements:",
             " '", paste(types, collapse = "', '"), "'")
      if (is.numeric(x) && length(unique(x)) != 2) {
        statistics <- statistics[["continuous"]]
      }
      else if (length(unique(x)) == 2) {
        if ("proportion" %in% names(statistics)) {
          statistics <- statistics[["proportion"]]
        }
        else {
          statistics <- statistics[["factor"]]
        }
      }
      else {
        statistics <- statistics[["factor"]]
      }
      if (is.character(statistics))
        statistics <- get(statistics)
    }
    if (!is.function(statistics)) {
      if (length(unique(x)) == 2) {
        statistics <- getPvalFisher
      }
      else if (is.numeric(x)) {
        if (length(unique(by)) == 2)
          statistics <- getPvalWilcox
        else statistics <- getPvalAnova
      }
      else {
        statistics <- getPvalFisher
      }
    }
    pval <- statistics(x = x, by = by)
  }
  if (missing(add_total_col) && hrzl_prop) {
    add_total_col = TRUE
  }
  if (is.null(x))
    stop("You haven't provided an x-value to do the statistics by.",
         " This error is most frequently caused by referencing an old",
         " variable name that doesn't exist anymore")
  if (is.null(by))
    stop("You haven't provided an by-value to do the statistics by.",
         " This error is most frequently caused by referencing an old",
         " variable name that doesn't exist anymore")
  if (label(x) == "")
    name <- deparse(substitute(x))
  else name <- label(x)
  if (is.logical(x))
    x <- factor(x, levels = c(TRUE, FALSE))
  if (any(is.na(by))) {
    warning(sprintf("Your 'by' variable has %d missing values",
                    sum(is.na(by))), "\n   The corresponding 'x' and 'by' variables are automatically removed")
    x <- x[!is.na(by)]
    if (inherits(x, "factor")) {
      x <- factor(x)
    }
    by <- by[!is.na(by)]
    if (inherits(by, "factor")) {
      by <- factor(by)
    }
  }
  if (useNA == "ifany" && any(is.na(x)))
    useNA <- "always"
  if (show_all_values)
    prop_fn <- describeFactors
  addEmptyValuesToMakeListCompatibleWithMatrix <- function(t) {
    for (n in names(t)) {
      if (is.matrix(t[[n]])) {
        tmp_names <- rownames(t[[n]])
        t[[n]] <- as.vector(t[[n]])
        names(t[[n]]) <- tmp_names
      }
    }
    all_row_names <- c()
    for (n in names(t)) {
      all_row_names <- union(all_row_names, names(t[[n]]))
    }
    if (is.null(all_row_names))
      return(t)
    if (any(is.na(all_row_names)))
      all_row_names <- append(all_row_names[is.na(all_row_names) ==
                                              FALSE], NA)
    ret <- list()
    for (n in names(t)) {
      ret[[n]] <- rep(0, times = length(all_row_names))
      names(ret[[n]]) <- all_row_names
      for (nn in all_row_names) {
        if (nn %in% names(t[[n]])) {
          if (is.na(nn)) {
            ret[[n]][is.na(names(ret[[n]]))] <- t[[n]][is.na(names(t[[n]]))]
          }
          else {
            ret[[n]][nn] <- t[[n]][nn]
          }
        }
      }
    }
    return(ret)
  }
  if (is.numeric(x)) {
    if (hrzl_prop)
      t <- by(x, by, FUN = continuous_fn, html = html,
              digits = digits, number_first = numbers_first,
              useNA = useNA, useNA.digits = useNA.digits, horizontal_proportions = table(is.na(x),
                                                                                         useNA = useNA), percentage_sign = percentage_sign)
    else t <- by(x, by, FUN = continuous_fn, html = html,
                 digits = digits, number_first = numbers_first, useNA = useNA,
                 useNA.digits = useNA.digits, percentage_sign = percentage_sign)
    if (length(t[[1]]) != 1) {
      fn_name <- deparse(substitute(continuous_fn))
      if (fn_name == "describeMean")
        names(t[[1]][1]) = "Mean"
      else if (fn_name == "describeMedian")
        names(t[[1]][1]) = "Median"
      else names(t[[1]][1]) = fn_name
    }
  }
  else if ((!is.factor(x) && length(unique(na.omit(x))) ==
              2) || (is.factor(x) && length(levels(x)) == 2) && hrzl_prop ==
             FALSE) {
    default_ref <- prDescGetAndValidateDefaultRef(x, default_ref)
    t <- by(x, by, FUN = prop_fn, html = html, digits = digits,
            number_first = numbers_first, useNA = useNA, useNA.digits = useNA.digits,
            default_ref = default_ref, percentage_sign = percentage_sign)
    name <- sprintf("%s %s", capitalize(levels(x)[default_ref]),
                    tolower(label(x)))
    if (NEJMstyle) {
      percent_sign <- ifelse(html, "%", "\\%")
      if (numbers_first)
        name <- sprintf("%s - no (%s)", name, percent_sign)
      else name <- sprintf("%s - %s (no)", name, percent_sign)
    }
    if (length(t[[1]]) == 1) {
      names(t[[1]][1]) = name
    }
  }
  else {
    if (hrzl_prop) {
      t <- by(x, by, FUN = factor_fn, html = html, digits = digits,
              number_first = numbers_first, useNA = useNA,
              useNA.digits = useNA.digits, horizontal_proportions = table(x,
                                                                          useNA = useNA), percentage_sign = percentage_sign)
    }
    else {
      t <- by(x, by, FUN = factor_fn, html = html, digits = digits,
              number_first = numbers_first, useNA = useNA,
              useNA.digits = useNA.digits, percentage_sign = percentage_sign)
    }
  }
  t <- addEmptyValuesToMakeListCompatibleWithMatrix(t)
  results <- matrix(unlist(t), ncol = length(t))
  getHeader <- function(tbl_cnt, header_count, html) {
    if (missing(header_count) || !header_count) {
      return(names(tbl_cnt))
    }
    if (is.character(header_count)) {
      if (!grepl("%s", header_count, fixed = TRUE))
        stop("Your header_count must accept a string character",
             " or it will fail to add the count, i.e. use the ",
             " format: 'Text before %s text after'")
      cnt_str <- sprintf(header_count, txtInt(tbl_cnt))
    }
    else {
      cnt_str <- paste("No.", txtInt(tbl_cnt))
    }
    return(mapply(txtMergeLines, names(tbl_cnt), cnt_str,
                  html = html))
  }
  cn <- getHeader(table(by), header_count, html)
  if (class(t[[1]]) == "matrix")
    rownames(results) <- rownames(t[[1]])
  else rownames(results) <- names(t[[1]])
  if (is.null(rownames(results)) && nrow(results) == 1)
    rownames(results) <- name
  if (!missing(add_total_col) && add_total_col != FALSE) {
    total_table <- prGetStatistics(x[is.na(by) == FALSE],
                                   numbers_first = numbers_first, show_perc = total_col_show_perc,
                                   show_all_values = show_all_values, useNA = useNA,
                                   useNA.digits = useNA.digits, html = html, digits = digits,
                                   continuous_fn = continuous_fn, factor_fn = factor_fn,
                                   prop_fn = prop_fn, percentage_sign = percentage_sign)
    if (!is.matrix(total_table)) {
      total_table <- matrix(total_table, ncol = 1, dimnames = list(names(total_table)))
    }
    if (nrow(total_table) != nrow(results)) {
      stop("There is an discrepancy in the number of rows in the total table",
           " and the by results: ", nrow(total_table), " total vs ",
           nrow(results), " results", "\n Rows total:",
           paste(rownames(total_table), collapse = ", "),
           "\n Rows results:", paste(rownames(results),
                                     collapse = ", "))
    }
    cn_tot <- getHeader(c(Total = length(x[is.na(by) == FALSE])),
                        header_count, html)
    if (add_total_col != "last") {
      results <- cbind(total_table, results)
      cn <- c(cn_tot, cn)
    }
    else {
      results <- cbind(results, total_table)
      cn <- c(cn, cn_tot)
    }
  }
  if (use_units) {
    if (units(x) != "") {
      unitcol <- rep(sprintf("%s", units(x)), times = NROW(results))
      unitcol[rownames(results) == "Missing"] <- ""
    }
    else {
      unitcol <- rep("", times = NROW(results))
    }
    if (length(unitcol) != nrow(results)) {
      stop("There is an discrepancy in the number of rows in the units",
           " and the by results: ", length(unitcol), " units vs ",
           nrow(results), " results", "\n Units:", paste(unitcol,
                                                         collapse = ", "), "\n Rows results:", paste(rownames(results),
                                                                                                     collapse = ", "))
    }
    results <- cbind(results, unitcol)
    cn <- c(cn, "units")
  }
  if (is.function(statistics)) {
    pval <- txtPval(pval, lim.sig = statistics.sig_lim, lim.2dec = statistics.two_dec_lim,
                    html = html)
    results <- cbind(results, c(pval, rep("", nrow(results) -
                                            1)))
    cn <- c(cn, "P-value")
  }
  colnames(results) <- cn
  label(results) <- name
  return(results)
}


vcf_histogram <- function(vcf, ...) {
  require(VariantAnnotation)
  require(dplyr)
  require(ggplot2)

  info <- as_tibble(info(exVCF))

  plot <- info %>%
    group_by(DP) %>%
    summarise(n = n()) %>%
    ggplot(aes(x = DP, y = n, fill = DP)) +
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_blank())

  return(plot)
}

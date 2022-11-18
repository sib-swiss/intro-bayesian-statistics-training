
cols <- c("grey", "dodgerblue", "darkorchid4", "firebrick3", "grey")

local_col <- cols[which((local_samp_value < xlims)[-1]*(local_samp_value > xlims)[-length(xlims)] == 1)]

abline(v = local_samp_value, col = local_col, lwd = 3)
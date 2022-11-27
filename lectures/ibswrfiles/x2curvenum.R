
xs <- 10*c(-300:300)/1000
ys <- xs^2
yscale <- 1.4

par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-3,3), ylim = c(0, yscale*1.05), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(-3:3), cex = 2)

lines(xs, ys, col = "darkorange", lwd = 2)

if (internalFlag) {
  bs <- seq(-1+1/n_bins, 1-1/n_bins, length.out=n_bins)
  local_tables <- bs^2
  for (ii in 1:length(bs)) {
   lines(rep(bs[ii], 2), c(0, local_tables[ii]), col = "firebrick3")
   points(bs[ii], local_tables[ii], col = firebricktrans, pch=19, cex = 3/sqrt(n_bins))
  }
} else {
  in_middle <- which(xs < 1 & xs > -1)
  lines(xs[in_middle], ys[in_middle], col = "firebrick3", lwd = 2)
}
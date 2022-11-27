
xs <- 10*c(-300:300)/1000
ys <- dnorm(xs)
yscale <- 1/sqrt(2*pi)

par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-3,3), ylim = c(0, yscale*1.05), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(-3:3), cex = 2)

polygon(c(-3, xs, 3, -3), c(0, ys, 0, 0), border = "dodgerblue", col = dodgerbluetrans, lwd = 2)

middle_xs <- which(xs < 1 & xs > -1)

polygon(c(-1, xs[middle_xs], 1, -1), c(0, ys[middle_xs], 0, 0), border = "darkorchid4", col = darkorchidtrans, lwd = 2)

if (internalFlag) {
  bs <- seq(-1+1/n_bins, 1-1/n_bins, length.out=n_bins)
  if (!internalFlag2) {
    local_tables <- dnorm(bs)
  }
  for (ii in 1:length(bs)) {
   polygon(bs[ii] + c(-1, -1, 1, 1)/n_bins, c(0, 1, 1, 0)*local_tables[ii], border = "firebrick3", col = firebricktrans)
  }
}
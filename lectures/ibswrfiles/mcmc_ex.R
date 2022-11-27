
xs <- 10*c(-300:300)/1000
ys <- target_dens(xs)
yscale <- max(ys)

if (internalFlag) {
  yscale <- yscale*1.2
}

par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-3,3), ylim = c(0, yscale*1.1), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(-3:3), cex = 2)

polygon(c(-3, xs, 3, -3), c(0, ys, 0, 0), border = "dodgerblue", col = dodgerbluetrans, lwd = 2)

ys_prop <- dnorm(xs, cur_x, q_sd)*q_sd/2

polygon(c(-3, xs, 3, -3), c(0, ys_prop, 0, 0), border = "darkorchid4", col = darkorchidtrans, lwd = 2)

abline(v = cur_x, col = "darkorchid4", lwd = 3)

abline(v = x_p, col = c("darkorange", "firebrick3")[acc_flag + 1], lwd = 3, lty = 2)

if (internalFlag) {
  summy <- sum(local_counts)
  for (ii in 1:30) {
    polygon((2*ii - 31 + c(-1, -1, 1, 1))/10, (1-exp(-summy/30))*c(0, 5, 5, 0)*local_counts[ii]/(summy), border = "firebrick3", col = firebricktrans)
  }
}
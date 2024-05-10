
if (internalFlag) {
  yscale <- yscale*1.2
}

par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-3,3), ylim = c(-yscale*1.1, yscale*1.1), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(-3:3), cex = 2, pos = 0)
axis(1, at = c(-3:3), cex = 2)

contour(xs,(rhos/6-7/6)*yscale*1.1/2, z, levels = 2^c(-1:5), drawlabels = FALSE, add = TRUE,
        col = hcl.colors(7, "Spectral"))

lines(rep(-3.15,2),c(-1,-1/6)*yscale*1.1, xpd = NA)
for(ii in -2:2){
  lines(c(-3.15,-3.25),rep((ii/3-7/6)*yscale*1.1/2,2), xpd = NA)
  text(-3.4, (ii/3-7/6)*yscale*1.1/2, 2*ii, xpd = NA, srt=90)
}
text(-3.5, -yscale*1.1, expression(rho), xpd = NA, srt=90)


polygon(c(-3, xs, 3, -3), c(0, ys, 0, 0), border = "dodgerblue", col = dodgerbluetrans, lwd = 2)

abline(v = cur_x, col = "darkorchid4", lwd = 3)

abline(v = x_p, col = c("darkorange", "firebrick3")[acc_flag + 1], lwd = 3, lty = 2)

eps <- step_xs[L+1] - step_xs[L]
min_eps <- 1e-2

if (abs(eps) < min_eps) {
  eps <- eps*min_eps/abs(eps)
}

arrows(step_xs[L], (step_rhos[L]/6-7/6)*yscale*1.1/2, 
       step_xs[L] + eps, (step_rhos[L+1]/6-7/6)*yscale*1.1/2,
       length = 0.18, angle = 30, lwd = 3,
       code = 2, col = c("darkorange", "firebrick3")[acc_flag + 1], lty = (2- acc_flag))

lines(step_xs, (step_rhos/6-7/6)*yscale*1.1/2, lwd = 3,
      col = c("darkorange", "firebrick3")[acc_flag + 1], lty = (2- acc_flag))

if (internalFlag) {
  summy <- sum(local_counts)
  for (ii in 1:30) {
    polygon((2*ii - 31 + c(-1, -1, 1, 1))/10, (1-exp(-summy/30))*c(0, 5, 5, 0)*local_counts[ii]/(summy), border = "firebrick3", col = firebricktrans)
  }
}
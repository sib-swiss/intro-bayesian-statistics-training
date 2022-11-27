
xs <- 10*c(-300:300)/1000
ys <- dnorm(xs)
yscale <- 1/sqrt(2*pi)

par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-3,3), ylim = c(0, yscale*1.25), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(-3:3), cex = 2)

polygon(c(-3, xs, 3, -3), c(0, ys, 0, 0), border = "dodgerblue", col = dodgerbluetrans, lwd = 2)

middle_xs <- which(xs < 1 & xs > -1)

polygon(c(-1, xs[middle_xs], 1, -1), c(0, ys[middle_xs], 0, 0), border = "darkorchid4", col = darkorchidtrans, lwd = 2)

if (internalFlag) {
  in_middle <- 1*(local_samp_value < 1 & local_samp_value > -1) + 1 # 2 is yes, 1 is no!
  abline(v = local_samp_value, col = c("darkorange", "firebrick3")[in_middle], lwd = 3)
}

if (internalFlag || internalFlag2) {
  if (input$show_cum || internalFlag2) {
    summy <- sum(local_counts)
    for (ii in 1:30) {
      in_middle <- 1*(ii < 21 & ii > 10) + 1 # 2 is yes, 1 is no!
      polygon((2*ii - 31 + c(-1, -1, 1, 1))/10, (1-exp(-summy/30))*c(0, 5, 5, 0)*local_counts[ii]/(summy), border = c("darkorange", "firebrick3")[in_middle], col = c(darkorangetrans, firebricktrans)[in_middle])
    }
  }
}

if (internalFlag2) {
  if(area_flag) {
    text(1.5, yscale, sum(local_counts[11:20])/sum(local_counts), cex = 2)
  }
}

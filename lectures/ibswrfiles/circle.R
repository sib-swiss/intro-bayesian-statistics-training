
par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(-1,1), ylim = c(-1, 1), axes = FALSE, xlab = "", ylab = "", asp=1)

polygon(c(-1, -1, 1, 1, -1), c(-1, 1, 1, -1, -1), 
        border = "dodgerblue", col = dodgerbluetrans, lwd = 2)

symbols(x=0, y=0, circles=1, inches=F, add=T, fg = "darkorchid4", bg = darkorchidtrans,
        lwd = 2)

in_circle <- 1*((local_samp_value_x^2 + local_samp_value_y^2) < 1) + 1 # 2 is yes, 1 is no!

if (length(local_samp_value_x) > 0) {
  points(local_samp_value_x, local_samp_value_y, 
     col = c("darkorange", "firebrick3")[in_circle],
     pch = 19, cex = 2 - internalFlag*log10(length(local_samp_value_x))/2.75)
}

if (internalFlag) {
  if(hit_flag) {
    text(0, 0, mean(in_circle) - 1, cex = 2)
  }
}
xlims <- c(0, 0.1, 0.5, 0.7, 0.8, 1)
par(mar = c(2, 2, 0, 0))

plot(NULL, xlim = c(local_bottomx, local_topx), ylim = c(0, 2), axes = FALSE, xlab = "", ylab = "")
axis(1, at = c(0:10)/10, cex = 2)

polygon(c(xlims[2], xlims[4], xlims[4], xlims[2], xlims[2]), c(1.6, 1.6, 1.2, 1.2, 1.6), 
        border = "dodgerblue", col = dodgerbluetrans, lwd = 2)
text(mean(xlims[c(2, 4)]), 1.4, "A", col = "dodgerblue", cex = 3)

polygon(c(xlims[3], xlims[5], xlims[5], xlims[3], xlims[3]), c(0.4, 0.4, 0.8, 0.8, 0.4), 
        border = "firebrick3", col = firebricktrans, lwd = 2)
text(mean(xlims[c(3, 5)]), 0.6, "B", col = "firebrick3", cex = 3)

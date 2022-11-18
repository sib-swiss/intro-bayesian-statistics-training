xs <- 5*c(-600:600)/1000
q2 <- sum(local_samples^2)
q1 <- sum(local_samples)
q0 <- length(local_samples)
ys <- exp(-(q2 - 2*q1*xs + q0*xs^2)/2)
yscale <- exp(-(q2 - 2*q1*mean(local_samples) + q0*mean(local_samples)^2)/2)
df <- data.frame(xs, ys)

pp <- ggplot() +
  xlab(expression(mu)) + ylab("Likelihood") +
  ylim(0, 1.25*yscale) +
  geom_point(data = df, mapping = aes(xs, ys), colour = "firebrick3", size = 2) +
  theme_bw(base_size = 18)
  pp <- pp + xlim(-3, 3)
  
if (internalFlag == TRUE) {
  local_y <- exp(-(q2 - 2*q1*local_mu + q0*local_mu^2)/2)
  pp <- pp + geom_vline(xintercept = local_mu, colour = "darkorange", linetype = 2, size = 2)
  pp <- pp + annotate("point", x = local_mu, y = local_y, colour = "darkorange", size = 4)
}


print(pp)

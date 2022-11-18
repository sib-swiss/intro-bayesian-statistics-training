xs <- 10*c(-300:300)/1000
ys <- dnorm(xs, mean = local_mean, sd = local_sd)
yscale <- 1/sqrt(2*pi*local_sd^2)
df <- data.frame(xs, ys)
dflol <- data.frame(xs = local_samples, 
                    ys = dnorm(local_samples, mean = local_mean, sd = local_sd))
pp <- ggplot() +
  xlab("x") + ylab("Probability density") +
  ylim(0, 1.25*yscale) +
  geom_point(data = df, mapping = aes(xs, ys), colour = "dodgerblue", size = 2) +
  theme_bw(base_size = 18)
  pp <- pp + xlim(-3, 3)
  pp <- pp + geom_segment(data = dflol, mapping = aes(x = xs, xend = xs, y = 0, yend = ys), 
                          colour = "darkorange")
  pp <- pp + geom_point(data = dflol, mapping = aes(xs, ys), 
                          colour = "darkorange", size = 3)
if (internalFlag == FALSE) {
  pp <- pp + annotate("text", label = paste("likelihood:", prod(dflol$ys)), 
                      x = 0, y = 1.2*yscale, size = 8, parse = TRUE)
} else {
  pp <- pp + annotate("text", label = paste("likelihood:", exp(-sum((local_samples-local_mean)^2)/2)), 
                      x = 0, y = 1.2*yscale, size = 8, parse = TRUE)
}

print(pp)

xs <- 5*c(-600:600)/1000
ys <- dt(xs/input$studentt_s, df = input$studentt_nu)/input$studentt_s
yscale <- 1/sqrt(2*pi)/input$studentt_s
q2 <- sum(local_samples^2)
q1 <- sum(local_samples)
q0 <- length(local_samples)
ys2 <- exp(-(q2 - 2*q1*xs + q0*xs^2)/2)
yscale2 <- exp(-(q2 - 2*q1*mean(local_samples) + q0*mean(local_samples)^2)/2)

if (internalFlag) {
  yrescale <- sum(ys*ys2)*(xs[2] - xs[1])
} else {
  yrescale <- 1
}

df <- data.frame(xs, ys = ys*ys2/yrescale)

cumvals <- cumsum(df$ys)/sum(df$ys)
cis <- c(df$xs[which.min((cumvals - 0.025)^2)], df$xs[which.min((cumvals - 0.975)^2)])

pp <- ggplot() +
  xlab(expression(mu)) + 
  geom_point(data = df, mapping = aes(xs, ys), colour = "darkorchid4", size = 2) +
  theme_bw(base_size = 18)
  pp <- pp + xlim(-3, 3)
  
if (internalFlag) {
  pp <- pp + ylab("Posterior")
} else {
  pp <- pp + ylab("Joint")
}

if (internalFlag2) {
  pp <- pp + geom_vline(xintercept=cis[1], colour = "darkorchid4", 
                        linetype = 3, size = 1) +
    geom_vline(xintercept = cis[2], colour = "darkorchid4", linetype = 3, size = 1)
  pp <- pp + geom_area(data = subset(subset(df, xs > cis[1]), xs < cis[2]), 
                       mapping = aes(xs, ys), colour = "darkorchid4", size = 1, fill = "darkorchid4", alpha = 0.33)
  pp <- pp + annotate("text", label = paste0(round(cis[2], 3), "]"), x = cis[2]+1, y = 0.8*max(df$ys), size = 8)
  pp <- pp + annotate("text", label = paste0("[", round(cis[1], 3), ","), x = cis[1]-1, y = 0.8*max(df$ys), size = 8)
  
} else {
  pp <- pp + geom_area(data = df, aes(xs, ys), colour = "darkorchid4", size = 1, fill = "darkorchid4",
                          alpha = 0.33)
}
  

    
print(pp)

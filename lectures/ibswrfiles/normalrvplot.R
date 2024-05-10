xs <- input$normal_mean + 10*input$normal_sd*c(-500:500)/1000
ys <- dnorm(xs, mean = input$normal_mean, sd = input$normal_sd)
yscale <- 1/sqrt(2*pi*input$normal_sd^2)
df<-data.frame(xs, ys)
pp <- ggplot(df, aes(xs, ys)) +
  xlab("x") + ylab("Probability density") +
  ylim(0, 1.5*yscale) +
  geom_point(colour = "dodgerblue", size = 3) +
  theme_bw(base_size = 18)
if (!input$normal_rescale) {
  pp <- pp + xlim(input$normal_mean - 5, input$normal_mean + 5) 
}
if (internalFlag == TRUE) {
  pp <- pp + geom_vline(xintercept = input$normal_mean, colour = "darkorchid4", linetype = 2, linewidth = 2) +
    annotate("text", label = "mu", x = input$normal_mean, y = 1.25*yscale, size = 8, parse = TRUE)
}
if (internalFlag2 == TRUE) {
  pp <- pp + annotate("text", label = "sigma", x = input$normal_mean + input$normal_sd/2, y = 0.8*yscale*exp(-1/2), size = 8, parse = TRUE) +
    geom_segment(aes(x = input$normal_mean, xend = input$normal_mean + input$normal_sd, y = yscale*exp(-1/2), yend = yscale*exp(-1/2)), 
                   arrow = arrow(length = unit(0.5, "cm")), colour = "firebrick3", linewidth = 2) + 
    annotate("text", label = "sigma", x = input$normal_mean - input$normal_sd/2, y = 0.8*yscale*exp(-1/2), size = 8, parse = TRUE) +
    geom_segment(aes(x = input$normal_mean, xend = input$normal_mean - input$normal_sd, y = yscale*exp(-1/2), yend = yscale*exp(-1/2)), 
                 arrow = arrow(length = unit(0.5, "cm")), colour = "firebrick3", linewidth = 2) +
    geom_segment(aes(x = input$normal_mean, xend = input$normal_mean, y = 0.95*yscale*exp(-1/2), yend = 1.05*yscale*exp(-1/2)),
                 colour = "firebrick3", linewidth = 2)
}
print(pp)

png(file="plot1.png",height=480,width=480)
with(df, hist(df$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
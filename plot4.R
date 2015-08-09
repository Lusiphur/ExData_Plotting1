results <- paste(df$Date, df$Time, collapse = NULL, sep = ' ')
df$datetime <- strptime(results, format = "%d/%m/%Y  %H:%M:%S")
png(file="plot4.png",height=480,width=480)
# Set multiple plots
par(mfrow = c(2, 2))
# Plot1
with(df, {
  plot(df$datetime, df$Global_active_power, type="l", xaxt="n", xlab="", ylab = "Global Active Power (kilowatts)")
  dayrange=c(min(df$datetime),max(df$datetime)+1)
  dayrange[2] <- as.POSIXlt(dayrange[2]+60)
  axis.POSIXct(1, at=seq(dayrange[1], dayrange[2], by="day"), format="%a")
# Plot 2
  plot(df$datetime, df$Voltage, type="l", xaxt="n", xlab="datetime", ylab = "Voltage")
  dayrange=c(min(df$datetime),max(df$datetime)+1)
  dayrange[2] <- as.POSIXlt(dayrange[2]+60)
  axis.POSIXct(1, at=seq(dayrange[1], dayrange[2], by="day"), format="%a")
# Plot 3
  plot(df$datetime, df$Sub_metering_1, type="l", xaxt="n", xlab="", ylab = "Energy Sub Metering")
  par(new=TRUE)
  lines(df$datetime, df$Sub_metering_2, type="l",col="red")
  lines(df$datetime, df$Sub_metering_3, type="l",col="blue")
  dayrange=c(min(df$datetime),max(df$datetime)+1)
  dayrange[2] <- as.POSIXlt(dayrange[2]+60)
  axis.POSIXct(1, at=seq(dayrange[1], dayrange[2], by="day"), format="%a")
  legend("topright", lty=1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
# Plot 4
  plot(df$datetime, df$Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab = "Global_reactive_power")
  dayrange=c(min(df$datetime),max(df$datetime)+1)
  dayrange[2] <- as.POSIXlt(dayrange[2]+60)
  axis.POSIXct(1, at=seq(dayrange[1], dayrange[2], by="day"), format="%a")
})
dev.off()
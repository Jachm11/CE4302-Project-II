`timescale 1ns/100ps
module Test_TopModule;

  // Parameters
  parameter TIME_PERIOD = 10; // Time period for clock generation

  // Inputs
  logic clock50;
  logic reset_n;

  // Outputs
  logic HDMI_I2S0, HDMI_MCLK, HDMI_LRCLK, HDMI_SCLK;
  logic [23:0] HDMI_TX_D;
  logic HDMI_TX_VS, HDMI_TX_HS, HDMI_TX_DE, HDMI_TX_CLK;
  logic HDMI_TX_INT;
  logic HDMI_I2C_SDA;
  logic HDMI_I2C_SCL;
  logic READY;

  // Instantiate the top module
  TopModule uut (
    .clock50(clock50),
    .reset_n(reset_n),
    .HDMI_I2S0(HDMI_I2S0),
    .HDMI_MCLK(HDMI_MCLK),
    .HDMI_LRCLK(HDMI_LRCLK),
    .HDMI_SCLK(HDMI_SCLK),
    .HDMI_TX_D(HDMI_TX_D),
    .HDMI_TX_VS(HDMI_TX_VS),
    .HDMI_TX_HS(HDMI_TX_HS),
    .HDMI_TX_DE(HDMI_TX_DE),
    .HDMI_TX_CLK(HDMI_TX_CLK),
    .HDMI_TX_INT(HDMI_TX_INT),
    .HDMI_I2C_SDA(HDMI_I2C_SDA),
    .HDMI_I2C_SCL(HDMI_I2C_SCL),
    .READY(READY)
  );

  // Clock generation
  always begin
    #5 clock50 = ~clock50;
  end

  // Initial block
  initial begin
    // Initialize inputs
    clock50 = 0;
    reset_n = 1;
    HDMI_I2C_SCL = 1;
	 #13;

    // Apply a reset
    #10 reset_n = 0;
  end

endmodule

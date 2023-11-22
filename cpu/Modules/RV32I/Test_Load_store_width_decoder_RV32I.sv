`timescale 1ns/1ns

module Test_Load_store_width_decoder_RV32I;

  // Define parameters
  parameter TIMEUNIT = 1ns;
  parameter TIMEPRECISION = 1ns;

  // Inputs
  logic load;
  logic store;
  logic load_vector;
  logic store_vector;
  logic [7:0] decoded_f3;

  // Output
  logic [2:0] width;

  // Instantiate Load_store_width_decoder_RV32I module
  Load_store_width_decoder_RV32I uut (
    .load(load),
    .store(store),
    .load_vector(load_vector),
    .store_vector(store_vector),
    .decoded_f3(decoded_f3),
    .width(width)
  );

  // Initial block for testbench
  initial begin
    // Initialize inputs
    load = 0;
    store = 0;
    load_vector = 0;
    store_vector = 0;
    decoded_f3 = 8'h00; // Assuming initial decoded_f3 value

    // Apply some test scenarios
    #10;
    load = 1;
    assert(width === 3'b000) else $fatal("Test Failed: Load width assertion");

    #10;
    store_vector = 1;
    decoded_f3 = 8'h20; // Assuming store vector instruction (f3 = 0b10000000)
    assert(width === 3'h5) else $fatal("Test Failed: Store vector width assertion");

    // Add more test scenarios as needed
  end

  // Add any other necessary simulation setup or monitor blocks here

endmodule

// tb.v
// Starter testbench template -- YOU complete this file.
//
// Goal: apply all 8 combinations of I0, I1, S (5 time units apart) to DUT
// and observe the output. Fill in every TODO below.

module tb;

  // 1. Declare inputs to drive as 'reg'
  reg  t_i0, t_i1, t_s;

  // 2. Declare outputs to observe as 'wire'
  wire t_y;

  // 3. Connect the DUT (DUT port name on the left, your testbench signal in parentheses)
  DUT DUT (
    .I0 (t_i0),
    .I1 (t_i1),
    .S  (t_s),
    .Y  (t_y)
  );

  // Waveform dump configuration (leave as provided)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  // 4. Feed in all 8 binary combinations of 3 inputs (000 through 111)
  initial begin
    // Format: {t_s, t_i1, t_i0}
    t_s = 0; t_i1 = 0; t_i0 = 0; #5;
    t_s = 0; t_i1 = 0; t_i0 = 1; #5;
    t_s = 0; t_i1 = 1; t_i0 = 0; #5;
    t_s = 0; t_i1 = 1; t_i0 = 1; #5;
    t_s = 1; t_i1 = 0; t_i0 = 0; #5;
    t_s = 1; t_i1 = 0; t_i0 = 1; #5;
    t_s = 1; t_i1 = 1; t_i0 = 0; #5;
    t_s = 1; t_i1 = 1; t_i0 = 1; #5;

    $finish; // Stops the simulation
  end

  // Automatically prints to the console whenever any listed signal changes
  initial
    $monitor($time, " I0=%b I1=%b S=%b | Y=%b", t_i0, t_i1, t_s, t_y);

endmodule
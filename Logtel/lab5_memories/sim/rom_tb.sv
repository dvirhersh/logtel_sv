`timescale 1ns / 1ps

module rom_tb;

  // Clock and stimulus signals
  logic        clka = 0;
  logic [9:0]  addra = 10'b1111111111;  // equivalent to (others => '1')
  logic [7:0]  douta;

  // Clock parameters
  localparam int ClockFrequencyHz = 100_000_000;
  localparam time ClockPeriod = 1_000_000_000ns / ClockFrequencyHz; // 10 ns

  // Clock generation
  always #(ClockPeriod / 2) clka = ~clka;

  // Stimulus: increment address every clock
  initial begin
    forever begin
      #(ClockPeriod);
      addra <= addra + 1;
    end
  end

  // DUT instantiation
  blk_mem_gen_0 uut_rom_1_2 (
    .clka(clka),
    .addra(addra),
    .douta(douta)
  );

endmodule

# Steps to Execute:

* Dual Port Memory:
```
iverilog -o ram_tb tb_dual_port_ram.v dual_port_ram.v
vvp ram_tb
gtkwave dual_port_ram.vcd
```
* 2 Flip-Flop Synchronizer:
```
iverilog -o sync_tb tb_sync_2ff.v sync_2ff.v
vvp sync_tb
gtkwave sync_2ff.vcd
```
---
<details>
  <summary>Output Screenshots: </summary>
  
  ### Dual-port Memory Module:

  ![image](https://github.com/user-attachments/assets/bbee1a02-069b-4523-8410-256fe5ebff2d)

  ### 2 Flip-Flop Synchronizer:

  ![image](https://github.com/user-attachments/assets/bbcb0696-bcce-4bc4-be29-1ea6996a9b7b)
  
</details>


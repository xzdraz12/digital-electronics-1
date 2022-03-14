## Preparation tasks (done before the lab at home)

1. Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents output value after the clock edge.

   ![Characteristic equations](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/equations.JPG)
 
   **D-type FF**
   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 0 | 0 | `q(n+1)` has the same level as `d` |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 1 | 0 | Set |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 0 | 1 | Set |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 1 | 1 | has the same level as `d` |

   **JK-type FF**
   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 0 | 0 | 0 | Output did not change |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 0 | 1 | 1 | Output did not change |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 1 | 1 | 0 | Reset |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 1 | 0 | 0 | Reset |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 0 | 0 | 1 | Set |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 0 | 1 | 1 | Set |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 1 | 0 | 1 | Invert |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 1 | 1 | 0 | Invert |

   **T-type FF**
   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 0 | 0 | Output did not change |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 0 | 1 | 1 | Output did not change |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 0 | 1 | Invert |
   | ![rising](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/05-ffs/sipka_hore.JPG) | 1 | 1 | 0 | Invert |

<a name="part1"></a>
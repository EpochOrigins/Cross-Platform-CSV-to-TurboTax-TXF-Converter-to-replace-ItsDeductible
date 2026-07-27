# Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible
This lightweight Bash script converts your charitable donation spreadsheets (.csv) into a standard .txf (Tax Exchange Format) file. You can import this file directly into TurboTax Desktop (Mac or Windows) to completely skip typing out long lists of donations by hand. 

The script features a universal awk-based date parser, making it fully compatible across macOS, Windows, and Linux systems without modifications.

💻 System Requirements
  macOS & Linux: Works natively right out of the box using Terminal.
  Windows: Requires a lightweight Linux-like environment to run the script. You must run it using one of the following:
    Git Bash (Recommended – included automatically with Git for Windows)
    WSL (Windows Subsystem for Linux)
    MSYS2 or Cygwin(Note: Standard Windows Command Prompt cmd.exe and PowerShell are not supported natively).
    
🚀 Installation & Setup
For macOS / Linux:
1. Open Terminal.
2.  Create the script file: bash
    nano convert.sh
3.  Paste the complete script code into the window.
4.  Press Ctrl + O then Enter to save, and Ctrl + X to exit.
5.  Make the script executable: 
    bash:  chmod +x convert.sh
    
For Windows:
1. Open Git Bash (or your preferred terminal environment).
2. Create and open the file:
    bash:    nano convert.sh
3. Paste the script code inside, save, and exit (Ctrl + O, Enter, Ctrl + X).
4. Make the script executable:bash
   chmod +x convert.sh


📖 How to Use
The script accepts an optional command-line argument (y or n) to control how TurboTax processes your entries. Status tracking updates are sent to the console window (stderr), ensuring your generated data file remains clean.
Option A: Unique Entry Mode (Recommended)
Pass y to force TurboTax to keep every single item line separate on your "Keep for Your Records" forms instead of summarizing them.
  bash:  ./convert.sh y < donations.csv > taxes.txf

Option B: Summarized ModePass n if you prefer TurboTax to summarize multiple entries under the exact same charity name
  bash:  ./convert.sh n < donations.csv > taxes.txf

Note: If you do not pass any argument, the script defaults to Unique Entry Mode (y).

📊 Data Examples
Sample Input (donations.csv)
Save your spreadsheet out as a plain text .csv file with headers matching this format:

 [small-test.csv](https://github.com/user-attachments/files/30428215/small-test.csv)
 
Sample Output Generated (taxes.txf)
The status logs display cleanly on your terminal screen without corrupting the output structure required by tax software:
V042
AUserExport
D07/27/2026
^
TD
FAIL
C1
L1
$-
X01/01/25 Goodwill                       Expens Goodwill                                                                                            
^
TD
N280
C1
L1
$-
X12/31/25 Red Cross                      Expens Red Cross                                                                                           
^


📥 How to Import into TurboTax
1. Open your TurboTax Desktop software.
2. Go to the top menu bar and select File > Import > From Accounting Software (or From TXF File).
3. Select your newly created taxes.txf file.
4. Follow the prompts to review and approve your imported itemized deductions!

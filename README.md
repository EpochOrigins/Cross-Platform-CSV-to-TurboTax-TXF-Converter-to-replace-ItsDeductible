# Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible

This lightweight Bash script converts your charitable donation spreadsheets `.csv` into a standard `.txf` (Tax Exchange Format) file. You can then import this file directly into TurboTax Desktop (Mac or Windows) to completely skip typing out donations by hand within TurboTax.  

The script features a universal awk-based date parser, making it fully compatible across macOS, Windows, and Linux systems without modifications.

### System Requirements. 
  macOS & Linux: Works natively right out of the box using Terminal.
  Windows: Requires a lightweight Linux-like environment to run the script. You must run it using one of the following:
    Git Bash (Recommended – included automatically with Git for Windows)
    WSL (Windows Subsystem for Linux)
    MSYS2 or Cygwin(Note: Standard Windows Command Prompt cmd.exe and PowerShell are not supported natively).
    
### Installation & Setup. 
For macOS / Linux:
1. Open the macOS Terminal App.
2.  Create the script file:
   
     Type terminal command:  `nano convert.sh`
4.  Paste the complete script code into the window.
5.  Press Ctrl + O then Enter to save, and Ctrl + X to exit.
6.  Make the script executable:
  
Type terminal command:  `chmod +x convert.sh`
    
For Windows:
1. Open Git Bash (or your preferred terminal environment).
2. Create and open the file:
   
     Type terminal command:  `nano convert.sh`

4. Paste the script code inside, save, and exit (Ctrl + O, Enter, Ctrl + X).
5. Make the script executable:
 
Type terminal command:  `chmod +x convert.sh`

### How to Use. 
The script accepts an optional command-line argument `y` or `n` to control how TurboTax will processes the records.

Option A: Unique Entry Mode (Recommended)
Pass `y` to force TurboTax to keep every single item line separate on your "Keep for Your Records" forms instead of summarizing them.  
Type terminal command:  ```./convert.sh y < donations.csv > taxes.txf```

Option B: Summarized Mode
Pass `n` if you prefer TurboTax to summarize multiple entries with the  same charity name.  
Type terminal command:  ```./convert.sh n < donations.csv > taxes.txf```

Note: If you do not pass any argument, the script defaults to `y` Option A.  Both options will have the same result and import the same Total amount into TurboTax, but Option A leaves a few more "Additional Info" forms as "Keep for Your Records".

### Data Examples. 
Sample Input (donations.csv)
Save your spreadsheet out as a plain text .csv file with headers matching this format:

 [small-test.csv](https://github.com/user-attachments/files/30428215/small-test.csv)
 
Sample Output Generated (taxes.txf)
The status logs display cleanly on your terminal screen without corrupting the output structure required by tax software:

[tax_import copy.txt](https://github.com/user-attachments/files/30428284/tax_import.copy.txt)


📥 How to Import into TurboTax
1. Open your TurboTax Desktop software.
2. Go to the top menu bar and select File > Import > From Accounting Software (or From TXF File).
3. Select your newly created taxes.txf file.
4. Follow the prompts to review and approve your imported itemized deductions!

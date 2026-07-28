## Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible

This lightweight Bash script converts your charitable donation spreadsheets `.csv` into a standard `.txf` (Tax Exchange Format) file. You can then import this file directly into TurboTax Desktop (Mac or Windows) to completely skip typing out donations by hand within TurboTax.  

The script features a universal awk-based date parser, making it fully compatible across macOS, Windows, and Linux systems without modifications.  

### System Requirements. 
  macOS & Linux: Works natively right out of the box using Terminal.
  Windows: Requires a lightweight Linux-like environment to run the script. You must run it using one of the following:
    Git Bash (Recommended – included automatically with Git for Windows)
    WSL (Windows Subsystem for Linux)
    MSYS2 or Cygwin(Note: Standard Windows Command Prompt cmd.exe and PowerShell are not supported natively).
    
### Installation & Setup. 
For macOS / Linux:  Open the macOS Terminal App.  
For Windows:  Open Git Bash (or your preferred terminal environment).
1.  Create the script file:  
     Type terminal command:  `nano convert.sh`
2.  [👉 Click here to open and copy the script](https://raw.githubusercontent.com/EpochOrigins/Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible/refs/heads/main/cvstotxf.sh)
3.  Paste the complete script code into the window.
4.  Press Ctrl + O then Enter to save, and Ctrl + X to exit.
5.  Make the script executable:  
     Type terminal command:  `chmod +x convert.sh`
    


### How to Use. 
The script accepts an optional command-line argument `y` or `n` to control how TurboTax will processes the records.

Option A: Unique Entry Mode (Recommended)
Pass `y` to force TurboTax to keep every single item line separate on your "Keep for Your Records" forms instead of summarizing them.  
Type terminal command:  ```./convert.sh y < donations.csv > TT_import.txf```

Option B: Summarized Mode
Pass `n` if you prefer TurboTax to summarize multiple entries with the  same charity name.  
Type terminal command:  ```./convert.sh n < donations.csv > TT_import.txf```

Note: If you do not pass any argument, the script defaults to `y` Option A.  Both options will have the same result and import the same Total amount into TurboTax, but Option A leaves a few more "Additional Info" forms as "Keep for Your Records".

### Data Examples. 
Sample Input. <br>
Click to download a sample donations spreadsheet in csv format. 
 👉  [donations.csv](https://github.com/user-attachments/files/30428215/small-test.csv)
 
Sample Output Generated (taxes.txf). <br>
Click to download a sample of the TurboTax Import file in .txf format. 
 👉  [TT_import.txf](https://github.com/user-attachments/files/30428284/tax_import.copy.txt). <br>
<sub> Footnote: Tax Exchange Format (.txf) files are compatible with TurboTax and other financial software. This sample is saved as a text file (.txt) for readability only.</sub>

### How to Import into TurboTax
1. Open your TurboTax Desktop software.  
2. Go to the top menu bar and select File > Import > From Accounting Software (or From TXF File).  
3. Select your newly created `TT_import.txf` file.  
4. Follow the prompts to review and approve your imported itemized deductions!  

### Tips.
The input spreadsheet must be the same format as the sample above with headers in line 1.  
Be sure your spreadsheet is saved as a .csv file type, NOT .xls  or .xlsx.  
TurboTax importing will only allow text files with the .txf file type.  
The .txf file has a rigid format, must be plain text (not formatted or saved as a .doc or .txt file type).

### Misc Features of this script. 
•	Runtime option to choose whether to keep charity names identical or append a unique sequential ID (-001, -002) to  the Charity names preventing TurboTax from merging separate donations.  
•	Flexible Date Parsing: Automatically handles date formats (e.g., January 15, 2025, Jan 15, 2025, 31-Dec-25, 12/31/2025) found in spreadsheets.
•	Smart CSV Parsing: Safely handles commas wrapped inside quotation marks without breaking the layout columns.  
•	Tax Code Mapping: Automatically detects and maps your donation type to standard IRS tax codes:  
	Code Contains "item" → N485 (Non-cash charity contributions)  
	Code Contains "money" → N280 (Cash charity contributions).  
•	Auto-Formatting: Cleans up spaces, removes raw dollar signs, and ensures all transaction amounts are properly formatted as negative deduction values.  

   

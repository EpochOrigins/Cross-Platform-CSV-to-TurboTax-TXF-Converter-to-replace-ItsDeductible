## FREE-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible

This lightweight Bash script converts your charitable donation spreadsheets `.csv` into a standard `.txf` (Tax Exchange Format) file. You can then use IMPORT directly into TurboTax Desktop (Mac or Windows) to completely skip typing out donations by hand within TurboTax.  

As of 2026, TurboTax Importing of donations will be limited to only two types of donations: Items and Money. See Notes below for more information about reasons for this limitation. 

The script is designed to be compatible across macOS, Windows, and Linux systems without modifications. Its not an App so it requires users to run a few commands in terminal mode.

### 📎 System Requirements. 
  macOS & Linux: Works natively right out of the box using Terminal.
  Windows: Requires a lightweight Linux-like environment to run the script. You must run it using one of the following:
    Git Bash (Recommended – included automatically with Git for Windows)
    WSL (Windows Subsystem for Linux)
    MSYS2 or Cygwin(Note: Standard Windows Command Prompt cmd.exe and PowerShell are not supported natively).
    
### ⚙️ Installation & Setup. 
1.  Open your terminal app:  
        For macOS / Linux:  Open the macOS Utility App called Terminal.  
        For Windows:  Open Git Bash (or your preferred terminal environment) <br>
2.  Navigate to a good file path and folder to run scripts:  
     	In Windows one possibility is:  `C:\Scripts\your_script.sh` <br>
    	For Macs a possibility is Home Directory: `~/Scripts (which expands to /Users/yourusername/Scripts/your_script.sh)`<br>
3. Create the script file:  
     Type terminal command:  `nano convert.sh`
4.  [👉 Click here to open and copy the script](https://raw.githubusercontent.com/EpochOrigins/Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible/refs/heads/main/cvstotxf.sh)
5.  Paste the complete script code into the window.
6.  Press `Ctrl + O` then `Enter` to save, and `Ctrl + X` to exit.
7.  Make the script executable:  
     Type terminal command:  `chmod +x convert.sh` <br>
8.  Place your `donations.csv` file in the same directory


### 🚀 How to Use. 
The script accepts an optional command-line argument `y` or `n` to control how TurboTax will processes the records.

Option A: Unique Entry Mode (Recommended)
Pass `y` to force TurboTax to keep every single item line separate on your "Keep for Your Records" forms instead of summarizing them.  
Type terminal command:  ```./convert.sh y < donations.csv > TT_import.txf```

Option B: Summarized Mode
Pass `n` if you prefer TurboTax to summarize multiple entries with the  same charity name.  
Type terminal command:  ```./convert.sh n < donations.csv > TT_import.txf```

Note: If you do not pass any argument, the script defaults to `y` Option A.  Both options will have the same result and import the same Total amount into TurboTax, but Option A leaves a few more "Additional Info" forms as "Keep for Your Records".

### 📁 Data Examples. 
Sample Input. <br>
Click to download a sample donations spreadsheet in csv format. 
 👉  [donations.csv](https://github.com/user-attachments/files/30428215/small-test.csv)
 
Sample Output Generated (taxes.txf). <br>
Click to download a sample of the TurboTax Import file in .txf format. 
 👉  [TT_import.txf](https://github.com/user-attachments/files/30428284/tax_import.copy.txt).   <br>
<sub> Footnote: Tax Exchange Format (.txf) files are compatible with TurboTax and other financial software. This sample is saved as a text file (.txt) for readability only.</sub>

### ⌨️ How to Import into TurboTax
1. Open your TurboTax Desktop software.  
2. Go to the top menu bar and select File > Import > From Accounting Software (or From TXF File).  
3. Select your newly created `TT_import.txf` file.  
4. Follow the prompts to review and approve your newly imported tax deductions😃  

### ⭐ Tips.
The input spreadsheet must be the same format as the sample above with headers in the first row.  
Be sure your spreadsheet is saved as a .csv file type, NOT .xls  or .xlsx.  
TurboTax importing will only allow text files with the .txf file type.  
The .txf file has a rigid format, must be plain text (not formatted or saved as a .doc or .txt file type).  

### Notes, Features and Limitations of this script. 
If your new to running shell scripts on a Mac or Windows, get some basic help by asking AI "what are tips for running .sh script on macOS and Windows including folder locations and permissions for new getting started users?"
•	Runtime option to choose whether to keep charity names identical or append a unique sequential ID (-001, -002) to  the Charity names preventing TurboTax from merging separate donations.    
•	Flexible Date Parsing: Automatically handles date formats (e.g., January 15, 2025, Jan 15, 2025, 31-Dec-25, 12/31/2025) found in spreadsheets.  
•	Smart CSV Parsing: Safely handles commas wrapped inside quotation marks without breaking the layout columns.  
•	Tax Code Mapping: Automatically detects and maps your donation type to standard IRS tax codes:  
	Code Contains "item" → N485 (Non-cash charity contributions). 
	Code Contains "money" → N280 (Cash charity contributions). 
•	Auto-Formatting: Cleans up spaces, removes raw dollar signs, and ensures all transaction amounts are properly formatted as negative deduction values. 
☹️ LIMITATIONS
TurboTax donation importing will NOT allow Donation Descriptions to load into forms like ItsDeductible. 
Only ITEM and MONEY donations can import into TurboTax Due to TXF Limits
TurboTax donation importing will NOT allow Donation Descriptions to load into forms like ItsDeductible. 

The TXF file format supported by TurboTax and other software is very, very old (35 years+, to be exact) and the data format used is very limited. Unfortunately, this means that only two types of donations can be imported into TurboTax: Items and Money. Mileage and Stock donations must be entered manually into TurboTax because the TXF file does not allow this data to transfer with them the donation record.

### About the Author: 
I put this script together and donated it to the community to give everyone a free alternative now that ItsDeductible is gone. I’m a retired IT tech and a longtime TurboTax user, dating all the way back to its 1993 MacInTax days. This workaround isn’t for everyone since it requires venturing into the command line, but it absolutely works. Use it at your own discretion and enjoy. Thanks!

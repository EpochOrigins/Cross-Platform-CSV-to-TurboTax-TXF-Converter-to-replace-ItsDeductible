## FREE-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible

This lightweight Bash script converts your charitable donation spreadsheets `.csv` into a standard `.txf` (Tax Exchange Format) file. You can then use IMPORT directly into TurboTax Desktop (Mac or Windows) to completely skip typing out donations by hand within TurboTax.  

As of 2026, TurboTax Importing of donations will be limited to only two types of donations: Items and Money. See Notes below for more information about reasons for this limitation. 

### 📎 System Requirements. 
The script is designed to be compatible across macOS, Windows, and Linux systems without modifications. This is not an App you install, its a shell script so it requires users to run a few commands in terminal mode.<br>
* macOS & Linux: Works natively right out of the box using Terminal<br>
* Windows: Requires a lightweight Linux-like environment to run the script. You must run it using one of the following:<br>
&nbsp;&nbsp;&nbsp;&nbsp;Git Bash (Recommended – included automatically with Git for Windows)<br>
&nbsp;&nbsp;&nbsp;&nbsp;WSL (Windows Subsystem for Linux)<br>
&nbsp;&nbsp;&nbsp;&nbsp;MSYS2 or Cygwin(Note: Standard Windows Command Prompt cmd.exe and PowerShell are not supported natively).
    
### ⚙️ Installation & Setup. 
1.  Open your terminal app:  
&nbsp;&nbsp;&nbsp;&nbsp;For macOS / Linux:  Open the macOS Utility App called Terminal. <br>
&nbsp;&nbsp;&nbsp;&nbsp;For Windows:  Open Git Bash (or your preferred terminal environment) <br>
2.  Navigate to a good file path and folder to run scripts: <br>
&nbsp;&nbsp;&nbsp;&nbsp;In Windows one possibility is:  `C:\Scripts\your_script.sh` <br>
&nbsp;&nbsp;&nbsp;&nbsp;For Macs a possibility is Home Directory: `~/Scripts (which expands to /Users/yourusername/Scripts/your_script.sh)`<br>
3. Create the script file:  
&nbsp;&nbsp;&nbsp;&nbsp;Type terminal command:  `nano csvtotxf.sh`
4.  [👉 Click here to open and copy the script](https://raw.githubusercontent.com/EpochOrigins/Cross-Platform-CSV-to-TurboTax-TXF-Converter-to-replace-ItsDeductible/refs/heads/main/cvstotxf.sh)
5.  Paste the complete script code into the window.
6.  Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).
7.  Make the script executable:  
&nbsp;&nbsp;&nbsp;&nbsp;Type terminal command:  `chmod +x csvtotxf.sh` <br>
8.  Build your donation spreadsheet and place your `donations.csv` in the same directory.


### 🚀 How to Use. 
The script accepts an optional `y` (detailed) or `n` (summarized) argument to control TurboTax processing.

*   **Option A: Unique Charity Names (Recommended)**
    `./cvstotxf.sh y < donations.csv > TT_import.txf`
*   **Option B: Summarized Charity Names**
    `./cvstotxf.sh n < donations.csv > TT_import.txf`

Alternatively, running `./cvstotxf.sh < donations.csv > TT_import.txf` defaults to the standard behavior.

All options have the same Total results, but the default Option A provides a few more TurboTax "Additional Info" and "Keep for Your Records" forms.

### 📁 Data Examples. 
Sample Input. <br>
Click to view or download a sample donations spreadsheet in csv format. 
* 👉 <b><a href="donations.csv" download>Click here to download donations.csv</a></b>
 
Sample Output Generated (taxes.txf). <br>
Click to view or download a sample of the TurboTax Import file in .txf format. 
* 👉 <b><a href="TT_import.txf" download>Click here to download TT_import.txf</a></b>

<sub> Footnote: Tax Exchange Format (.txf) files are compatible with TurboTax and other financial software. 

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
FEATURES<br>
•	If you are new to running shell scripts on a Mac or Windows, get some basic help by asking AI "what are tips for running .sh scripts on macOS and Windows including folder locations and permissions for a new getting started user?"<br>
•	The option to choose whether to keep charity names identical or append a unique ID to prevent TurboTax from merging donations.    
•	Flexible Date Parsing: Automatically handles date formats (e.g., Jan 15, 2025, 31-Dec-25, 12/31/2025) found in spreadsheets.  
•	Smart CSV Parsing: Safely handles commas wrapped inside quotation marks without breaking the layout columns.  
•	Tax Code Mapping: Automatically detects and maps your donation type to standard IRS tax codes:<br>
	Code Contains "item" → N485 (Non-cash charity contributions)<br>
	Code Contains "money" → N280 (Cash charity contributions)<br>
•	Auto-Formatting: Cleans up spaces, removes raw dollar signs, and ensures amounts are formatted as negative deduction values.<br>
LIMITATIONS<br>
•	TurboTax importing will NOT allow Descriptions to load into tax worksheets like ItsDeductible did.<br>
•	The TXF file format supported by TurboTax and other software is very old (from the 1990s) and the data format used is very limited. Unfortunately, this means that only two types of donations can be imported into TurboTax: Items and/or Money. Mileage and Stock donations must be entered manually into TurboTax because the TXF file import does not allow this data.

### About the Author: 
I put this script together and donated it to the community to give everyone a free alternative now that ItsDeductible is gone. I’m a retired IT tech and a longtime TurboTax user, dating all the way back to its 1993 MacInTax days. This workaround isn’t for everyone since it requires venturing into the command line, but it absolutely works. Use it at your own discretion and enjoy. Thanks!<br>


### DISCLAIMER / LIABILITY WAIVER
`This script is provided "AS IS", without warranty of any kind, express or
implied, including but not limited to the warranties of merchantability or
fitness for a particular purpose. 
Use this script entirely AT YOUR OWN RISK. The author assumes no liability 
for data loss, incorrect tax calculations, file corruption, or system errors. 
Always back up your financial data and tax files before running this script.`

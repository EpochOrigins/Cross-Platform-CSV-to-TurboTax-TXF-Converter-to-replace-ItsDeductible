#!/bin/sh
# ==============================================================================
# Script Name:  TurboTax ItsDeductible Workaround
# Author:       Retired IT Professional (TurboTax user since 1993 / MacInTax)
# Description:  Provides a free community solution to the loss of ItsDeductible
#               by generating a compatible file for TurboTax import.
# Platform:     macOS (Terminal) / Windows (Git Bash or WSL)
# ==============================================================================
# DISCLAIMER / LIABILITY WAIVER
# This script is provided "AS IS", without warranty of any kind, express or
# implied, including but not limited to the warranties of merchantability or
# fitness for a particular purpose. 
#
# Use this script entirely AT YOUR OWN RISK. The author assumes no liability 
# for data loss, incorrect tax calculations, file corruption, or system errors. 
# Always back up your financial data and tax files before running this script.
# ==============================================================================
#
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#
# 1. Capture the first command-line argument into a descriptive variable
RESPONSE="$1"

# 2. Convert the input to lowercase to seamlessly handle 'Y' or 'N'
RESPONSE_LOWER=$(echo "$RESPONSE" | tr '[:upper:]' '[:lower:]')

# 3. Evaluate the variable result using a case statement
case "$RESPONSE_LOWER" in
    y|yes)
# This goes to the console screen, NOT the redirected file
        echo "You selected YES, so each line in your .csv file will create a unique Charity name" >&2
        DETAILS_CHOICE="yes"
        ;;
    n|no)
        echo "You selected NO, so each Charity found in your .csv file will be summarized by TurboTax" >&2
        DETAILS_CHOICE="no"
        ;;
    *)
        echo "By default each line in your .csv file will create a unique Charity name"  >&2 
        DETAILS_CHOICE="yes"
        ;;
esac


# Defaut is set to "yes", that makes all docations have a unique Charity Name, that
#       will force TurboTax to create one entry for each dated line and not summarize
#       This makes no difference to the end results, only provides additional records
#       inside TurboTax in the form of "Keep for your Records" forms.

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#
# Helper function compatible with macOS, Windows Git Bash, and Linux
format_date() {
    local input_date="$1"
    
    # Strip spaces and outer quotes
    input_date=$(echo "$input_date" | xargs | tr -d '"')

    # IMPORTANT: Restore the real comma if it was altered by the awk CSV parser
    input_date=$(echo "$input_date" | sed 's/||COMMA||/,/g')

    case "$(echo "$input_date" | tr '[:upper:]' '[:lower:]')" in
        various | "")
            echo "Various "
            return 0
            ;;
    esac

    # Cross-platform parsing using pure awk (handles MM/DD/YYYY, MM/DD/YY, and DD-MMM-YY)
    local standard_date
    standard_date=$(echo "$input_date" | awk '
    BEGIN {
        # Map textual month abbreviations to numeric strings
        m["jan"]="01"; m["feb"]="02"; m["mar"]="03"; m["apr"]="04";
        m["may"]="05"; m["jun"]="06"; m["jul"]="07"; m["aug"]="08";
        m["sep"]="09"; m["oct"]="10"; m["nov"]="11"; m["dec"]="12";
        m["january"]="01"; m["february"]="02"; m["march"]="03"; m["april"]="04";
        m["june"]="06"; m["july"]="07"; m["august"]="08"; m["september"]="09";
        m["october"]="10"; m["november"]="11"; m["december"]="12";
    }
    {
        gsub(/,/, "", $0); # Remove commas from "Month DD, YYYY"
        
        # Match MM/DD/YYYY or MM/DD/YY
        if ($0 ~ /^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4}$/) {
            split($0, parts, "/");
            mm = sprintf("%02d", parts[1]);
            dd = sprintf("%02d", parts[2]);
            yy = length(parts[3]) == 4 ? substr(parts[3], 3, 2) : parts[3];
            print mm "/" dd "/" yy;
            exit;
        }
        
        # Match DD-MMM-YY (e.g., 31-Dec-25)
        if ($0 ~ /^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2,4}$/) {
            split($0, parts, "-");
            mon = lcase(parts[2]);
            mm = m[mon];
            dd = sprintf("%02d", parts[1]);
            yy = length(parts[3]) == 4 ? substr(parts[3], 3, 2) : parts[3];
            if (mm != "") { print mm "/" dd "/" yy; exit; }
        }
        
        # Match Spelled Month first (e.g., "January 15, 2025" or "Jan 15, 2025")
        if (NF >= 3) {
            mon = lcase($1);
            if (mon in m) {
                mm = m[mon];
                dd = sprintf("%02d", $2);
                yy = length($3) == 4 ? substr($3, 3, 2) : $3;
                print mm "/" dd "/" yy;
                exit;
            }
        }
    }
    function lcase(str) {
        return tolower(str);
    }
    ')

    # Final Fallback safety check if formatting fails
    if [ -z "$standard_date" ]; then
        echo "01/01/25"
    else
        echo "$standard_date"
    fi
}
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -#

# Print the mandatory TXF file headers (Cross-platform safe)
echo "V042"
echo "AUserExport"
echo "D$(date +%m/%d/%Y 2>/dev/null || echo "01/01/2025")"


# Initialize the three-digit sequence counter
seq_num=1

# Pre-process the CSV input stream using awk to safely hide commas inside quotes

awk -v q='"' '
BEGIN { FS = q; OFS = q }
{
    for (i = 2; i <= NF; i += 2) {
        gsub(/,/, "||COMMA||", $i)
    }
    print
    
# OLD FIELD ORDER csv_charity ignored_address csv_date csv_type ignored_irs csv_description csv_amount
#  }' | while IFS=',' read -r csv_charity ignored_address csv_date csv_type ignored_irs csv_description csv_amount || [ -n "$csv_charity" ]; do
# NEW FIELD ORDER csv_charity csv_date csv_type ignored_irs csv_description csv_amount ignored_address

}' | while IFS=',' read -r csv_charity csv_date csv_type ignored_irs csv_description csv_amount ignored_address || [ -n "$csv_charity" ]; do
    
# Strip carriage returns (\r) and any leftover wrapping quotes (")
    csv_date=$(echo "$csv_date" | tr -d '\r' | tr -d '"')
    csv_charity=$(echo "$csv_charity" | tr -d '\r' | tr -d '"')
    csv_type=$(echo "$csv_type" | tr -d '\r' | tr -d '"')
    csv_description=$(echo "$csv_description" | tr -d '\r' | tr -d '"')
    csv_amount=$(echo "$csv_amount" | tr -d '\r' | tr -d '"')

# Restore real commas to the fields if they had any embedded ones
    csv_charity=$(echo "$csv_charity" | sed 's/||COMMA||/,/g')
    csv_description=$(echo "$csv_description" | sed 's/||COMMA||/,/g')

# Skip header row by checking the date column
    case "$(echo "$csv_date" | tr '[:upper:]' '[:lower:]')" in
        date | "") continue ;; 
    esac

    txf_date=$(format_date "$csv_date")
    txf_amount=$(echo "$csv_amount" | tr -d '$' | xargs)

# Force amounts to be negative for tax deductions
    case "$txf_amount" in
        -* ) ;; 
        * ) txf_amount="-${txf_amount}" ;;
    esac

# Convert the type field to lowercase for checking
    lower_type=$(echo "$csv_type" | tr '[:upper:]' '[:lower:]')

# Wildcard checking to assign tax code
    case "$lower_type" in
        *item*)  txf_ncode="N485" ;;
        *money*) txf_ncode="N280" ;;
        *)       txf_ncode="FAIL" ;; # Fallback if no match
    esac

# Formats loop count to 3 digits (001, 002, 003...)
   
   padded_seq=$(printf "%03d" "$seq_num")
   if [ "$DETAILS_CHOICE" = "yes" ]; then
    unique_charity_name="${csv_charity}-${padded_seq}"
   else
    unique_charity_name="${csv_charity}"
   fi

    # Combine charity and description
   if [ -n "$csv_description" ]; then
        final_description="${csv_description}"
   else
        final_description="$csv_charity"
   fi

#---The "X" line requires fixed length fields-----------

    x_line=$(printf "X%-8.8s %-30.30s %-6.6s %-100.100s" \
        "$txf_date" \
        "$final_description" \
        "Expens" \
        "$unique_charity_name")

# Output the structured TXF block
    echo "^"
    echo "TD"
    echo "$txf_ncode"
    echo "C1"
    echo "L1"
    echo "\$$txf_amount"
    echo "$x_line"


# Increment the sequence number for the next data row
    seq_num=$((seq_num + 1))

done
# end of do loop

# Print final closing delimiter
echo "^" 

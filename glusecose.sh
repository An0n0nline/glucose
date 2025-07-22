#!/bin/bash

# Glucose level analyzer script

# Define ranges (mg/dL)
NORMAL_MIN=70
NORMAL_MAX=140
ELEVATED_MAX=180
HYPER_MAX=250
HYPO_MIN=54

# Colors for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Get user input
read -p "Enter your glucose reading (mg/dL): " glucose

# Validate input
if ! [[ "$glucose" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    exit 1
fi

# Determine status
if [ "$glucose" -lt "$HYPO_MIN" ]; then
    status="DANGEROUSLY LOW - Seek immediate medical attention"
    color=$PURPLE
elif [ "$glucose" -lt "$NORMAL_MIN" ]; then
    status="Low (Hypoglycemia)"
    color=$BLUE
elif [ "$glucose" -le "$NORMAL_MAX" ]; then
    status="Normal"
    color=$GREEN
elif [ "$glucose" -le "$ELEVATED_MAX" ]; then
    status="Elevated"
    color=$YELLOW
elif [ "$glucose" -le "$HYPER_MAX" ]; then
    status="High (Hyperglycemia)"
    color=$RED
else
    status="EXTREMELY HIGH - Seek medical attention"
    color=$PURPLE
fi

# Print analysis
echo -e "\nGlucose reading: ${color}${glucose} mg/dL${NC}"
echo -e "Status: ${color}${status}${NC}\n"

# Create simple bar chart
echo "Glucose Level Chart:"
echo "--------------------------------------------------"

# Calculate bar position (scale glucose to 50 character width)
max_chart_value=300
bar_length=$(( glucose * 50 / max_chart_value ))
[ "$bar_length" -gt 50 ] && bar_length=50
[ "$bar_length" -lt 1 ] && bar_length=1

# Print the bar
printf "|"
for ((i=1; i<=$bar_length; i++)); do
    printf "${color}#${NC}"
done
for ((i=$bar_length; i<50; i++)); do
    printf "-"
done
printf "|\n"

# Print markers
echo "--------------------------------------------------"
printf "%-10s %-15s %-15s %-10s\n" "<54" "70" "140" "180" ">250"
echo -e "\nNote: Ranges are approximate. Consult your healthcare provider\nfor personalized targets and recommendations."

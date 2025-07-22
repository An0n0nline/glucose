Glucose Reading Analyzer - Bash Script

📝 Description
A simple bash script that analyzes blood glucose readings and provides:
Classification (Low/Normal/High/etc.)
Color-coded status output
ASCII bar chart visualization of where the reading falls
Reference ranges for comparison

🛠️ Features
Input validation - Ensures only numeric values are accepted
Color-coded output - Easy visual identification of status
Visual chart - ASCII bar graph showing reading position
Configurable ranges - Modify thresholds in the script as needed

📊 Glucose Classification Ranges
Range (mg/dL)	Classification	Color
<54	Dangerously Low	Purple
54-69	Low (Hypoglycemia)	Blue
70-140	Normal	Green
141-180	Elevated	Yellow
181-250	High (Hyperglycemia)	Red
>250	Extremely High	Purple

🚀 Installation & Usage

Clone the repository:
git clone https://github.com/yourusername/glucose-analyzer.git
cd glucose-analyzer

Make the script executable:
chmod +x glucose_check.sh
Run the script:
./glucose_check.sh

🖼️ Example Output
Enter your glucose reading (mg/dL): 185

Glucose reading: 185 mg/dL
Status: High (Hyperglycemia)

Glucose Level Chart:
--------------------------------------------------
|###############################-----------------|
--------------------------------------------------
<54        70             140            180      >250


⚙️ Customization
Edit the threshold values in the script to match your specific needs:
# Define ranges (mg/dL)
NORMAL_MIN=70
NORMAL_MAX=140
ELEVATED_MAX=180
HYPER_MAX=250
HYPO_MIN=54

⚠️ Disclaimer
This script is for informational purposes only and not a substitute for professional medical advice. Always consult with your healthcare provider regarding your glucose management.

📄 License
MIT License

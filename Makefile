FinalProjectP4JS.html: FinalProjectP4JS.Rmd \
 Clean_Data/Clean_Data.RDS \
 Tables_Figures/table_one.RDS \
 Tables_Figures/Seatbelt_Weather_Figure.RDS \
 Code/Render_Report.R
	Rscript Code/Render_Report.R
	
Tables_Figures/table_one.RDS: Clean_Data/Clean_Data.RDS Code/TableOne.R
	Rscript Code/TableOne.R
	
Tables_Figures/Seatbelt_Weather_Figure.RDS: Clean_Data/Clean_Data.RDS Code/Figure1.R
	Rscript Code/Figure1.R

Clean_Data/Clean_Data.RDS: Raw_Data/GA_SeatbeltSurvey_2023_Adult_Final.xlsx Code/CleanData.R
	Rscript Code/CleanData.R

project_image:
	docker pull jshtulman1/finalproject:latest
	docker tag jshtulman1/finalproject:latest project_image
	touch project_image

.PHONY: report
report: project_image
	@mkdir -p "Final Report"
	docker run -v "$$(pwd)/Final\ Report":/final_report project_image

clean:
	rm -f Clean_Data/Clean_Data.RDS \
	      Tables_Figures/table_one.RDS \
	      Tables_Figures/Seatbelt_Weather_Figure.RDS \
	      FinalProjectP4JS.html 
	rm -rf "Final Report"
	      
.PHONY: all clean

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
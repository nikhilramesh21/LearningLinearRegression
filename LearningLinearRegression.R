training=read.csv('/Users/nikhilramesh/Desktop/participant_files/Data/training.csv')
validation= read.csv('/Users/nikhilramesh/Desktop/participant_files/Data/validation.csv')
#to convert qualitative variables into quantitaitve binary variables in the training data this will help us calculate correlations
#It is reasonable  to assume that the Category and the genre of the book will have a significant correlation with the sales of a particular book  
#For major category 
training$major_category_fiction=0 
training$major_category_fiction[with(training, major_category == "Fiction")] <- 1
training$major_category_nonfiction=0 
training$major_category_nonfiction[with(training, major_category == "Non-Fiction")] <- 1
training$major_category_Children=0 
training$major_category_Children[with(training, major_category == "Children")] <- 1
training$major_category_YoungAdult=0 
training$major_category_YoungAdult[with(training, major_category == "Young Adult")] <- 1
#For Genre
training$genre_Adventure=0 
training$genre_Adventure[with(training, genre == "Adventure")] <- 1
training$genre_Fairytales_Folklore=0 
training$genre_Fairytales_Folklore[with(training, genre == "Fairytales/Folklore")] <- 1
training$genre_Fantasy=0 
training$genre_Fantasy[with(training, genre == "Fantasy")] <- 1
training$genre_Graphic_Novel=0 
training$genre_Graphic_Novel[with(training, genre == "Graphic Novel")] <- 1
training$genre_Historical_Fiction=0 
training$genre_Historical_Fiction[with(training, genre == "Historical Fiction")] <- 1
training$genre_History=0 
training$genre_History[with(training, genre == "History")] <- 1
training$genre_Horror=0 
training$genre_Horror[with(training, genre == "Horror")] <- 1
training$genre_Humor=0 
training$genre_Humor[with(training, genre == "Humor")] <- 1
training$genre_Instructional=0 
training$genre_Instructional[with(training, genre == "Instructional")] <- 1
training$genre_Mystery=0 
training$genre_Mystery[with(training, genre == "Mystery")] <- 1
training$genre_Picture_Books=0 
training$genre_Picture_Books[with(training, genre == "Picture Books")] <- 1
training$genre_Referencen=0 
training$genre_Reference[with(training, genre == "Reference")] <- 1
training$genre_Romance=0 
training$genre_Romance[with(training, genre == "Romance")] <- 1
training$genre_Rhythmic=0 
training$genre_Rhythmic[with(training, genre == "Rhythmic")] <- 1
training$genre_Science_Fiction=0 
training$genre_Science_Fiction[with(training, genre == "Science Fiction")] <- 1
training$genre_Scientific=0 
training$genre_Scientific[with(training, genre == "Scientific")] <- 1
training$genre_Text_Book=0 
training$genre_Text_Book[with(training, genre == "Text Book")] <- 1
#Other qualitative variables that had a high correlation with sales: 
training$gender_male=0 
training$gender_male[with(training, gender=='male')]<-1 
training$gender_female=0 
training$gender_female[with(training, gender=='female')]<-1 
training$book_structure_A=0 
training$book_structure_A[with(training,book_structure_az=='A')]<-1
training$book_structure_B=0 
training$book_structure_B[with(training,book_structure_az=='B')]<-1
training$book_structure_C=0 
training$book_structure_C[with(training,book_structure_az=='C')]<-1
training$book_structure_D=0 
training$book_structure_D[with(training,book_structure_az=='D')]<-1
#Now that we have added these to the training data set we also need to add them to the validation set as well
#For major category 
validation$major_category_fiction=0 
validation$major_category_fiction[with(validaiton, major_category == "Fiction")] <- 1
validation$major_category_nonfiction=0 
validation$major_category_nonfiction[with(validation, major_category == "Non-Fiction")] <- 1
validation$major_category_Children=0 
validation$major_category_Children[with(validation, major_category == "Children")] <- 1
validation$major_category_YoungAdult=0 
validation$major_category_YoungAdult[with(validation, major_category == "Young Adult")] <- 1
#For Genre
validation$genre_Adventure=0 
validation$genre_Adventure[with(validation, genre == "Adventure")] <- 1
validation$genre_Fairytales_Folklore=0 
validation$genre_Fairytales_Folklore[with(validation, genre == "Fairytales/Folklore")] <- 1
validation$genre_Fantasye=0 
validation$genre_Fantasy[with(validation, genre == "Fantasy")] <- 1
validation$genre_Graphic_Novel=0 
validation$genre_Graphic_Novel[with(validation, genre == "Graphic Novel")] <- 1
validation$genre_Historical_Fiction=0 
validation$genre_Historical_Fiction[with(validation, genre == "Historical Fiction")] <- 1
validation$genre_History=0 
validation$genre_History[with(validation, genre == "History")] <- 1
validation$genre_Horror=0 
validation$genre_Horror[with(validation, genre == "Horror")] <- 1
validation$genre_Humor=0 
validation$genre_Humor[with(validation, genre == "Humor")] <- 1
validation$genre_Instructional=0 
validation$genre_Instructional[with(validation, genre == "Instructional")] <- 1
validation$genre_Mystery=0 
validation$genre_Mystery[with(validation, genre == "Mystery")] <- 1
validation$genre_Picture_Books=0 
validation$genre_Picture_Books[with(validation, genre == "Picture Books")] <- 1
validation$genre_Referencen=0 
validation$genre_Reference[with(validation, genre == "Reference")] <- 1
validation$genre_Romance=0 
validation$genre_Romance[with(validation, genre == "Romance")] <- 1
validation$genre_Rhythmic=0 
validation$genre_Rhythmic[with(validation, genre == "Rhythmic")] <- 1
validation$genre_Science_Fiction=0 
validation$genre_Science_Fiction[with(validation, genre == "Science Fiction")] <- 1
validation$genre_Scientific=0 
validation$genre_Scientific[with(validation, genre == "Scientific")] <- 1
validation$genre_Text_Book=0 
validation$genre_Text_Book[with(validation, genre == "Text Book")] <- 1
#Other qualitative variables that have a correlation 
validation$gender_male=0 
validation$gender_male[with(validation, gender=='male')]<-1 
validation$gender_female=0 
validation$gender_female[with(validation, gender=='female')]<-1 
validation$book_structure_A=0 
validation$book_structure_A[with(validation,book_structure_az=='A')]<-1
validation$book_structure_B=0 
validation$book_structure_B[with(validation,book_structure_az=='B')]<-1
validation$book_structure_C=0 
validation$book_structure_C[with(validation,book_structure_az=='C')]<-1
validation$book_structure_D=0 
validation$book_structure_D[with(validation,book_structure_az=='D')]<-1
# We can now use these along with other parameters to build a multiple linear regression model that will predict the sales of the books 
fit <- lm(sales~major_category_fiction+ major_category_YoungAdult+ major_category_Children+ major_category_nonfiction+ gender_female+ gender_male+ genre_Text_Book+ genre_Scientific+ genre_Science_Fiction+ genre_Rhythmic+ genre_Romance+ genre_Referencen+ genre_Picture_Books+ genre_Mystery+ genre_Instructional+ genre_Humor+ genre_Horror+ genre_History+ genre_Historical_Fiction+ genre_Graphic_Novel+ genre_Fantasy+ genre_Fairytales_Folklore+ genre_Adventure+ flesch_kincaid_reading_level+ previous_sales
,training)
summary.lm(fit) 
validation_sales_pred<- predict(fit, validation)








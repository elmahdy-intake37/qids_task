require 'csv'

namespace :custom do
desc "Importing Usage data from CSV file"
task import: :environment do

    # movies = "./movies.csv"
    # review = "./review.csv"


    first_file = CSV.read('movies.csv')
    second_file = CSV.read('reviews.csv')

    output = CSV.generate do |csv|
      first_file.each_with_index do |row, i|
        begin
          csv << (row + second_file[i])
        rescue
          puts "error"
        end
      end
    end

    File.write("output.csv", output)
    CSV.foreach('output.csv', headers: true) do |row|
        movie = Movie.create(description: row['Description'],
               title: row['Movie'])
        user = User.create(username: row['User'])

        Review.create(
          user: user,
          movie: movie,
          stars: row['Stars'],
          review: row['Review'],
        )

         end
      end

  # CSV.foreach(movies, headers: true) do |row|
  #     movie = Movie.find_or_create_by(description: row['Description'],
  #           title: row['Movie'])
  #
  #     end

end

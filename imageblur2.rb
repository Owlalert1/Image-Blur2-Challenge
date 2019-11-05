class Image 
    attr_accessor :picture
  
    def initialize(picture)
      @picture = picture
    end

    def find_ones
      ones = []
      @picture.each_with_index do |row, row_index|
        row.each_with_index do |item, column_index|
          if item == 1
            ones << [row_index, column_index]
          end
        end
      end
      ones
    end

    def blur_around
      ones = find_ones
        @picture.each_with_index do |row, row_index|
          row.each_with_index do |item, column_index|
            ones.each do |location_row_index, location_column_index|

              if row_index == location_row_index && column_index == location_column_index
                @picture[row_index -1][column_index] = 1 unless row_index == 0
                @picture[row_index +1][column_index] = 1 unless row_index >= 3
                @picture[row_index][column_index -1] = 1 unless column_index == 0
                @picture[row_index][column_index +1] = 1 unless column_index >= 3
              end
            end
          end
        end
    end
    


    def output_image
      @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#output for blur1
image.output_image
puts
image.blur_around

#output for blur2
image.output_image
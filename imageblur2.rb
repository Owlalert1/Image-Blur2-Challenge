class Image 
    attr_accessor :picture
  
    def initialize(picture)
      @picture = picture
    end

    def output_image
      @picture.each do |data|
      puts data.join
      end
    end



    def blur_around
      ones = []
      @picture.each_with_index do |row, row_index|
        row.each_with_index do |item, column_index|
          if item == 1
            ones << [row_index, column_index]
          end
        end
      end
     

      ones.each do |row_index, column_index|
        @picture[row_index -1][column_index] = 1 unless row_index == 0
        @picture[row_index +1][column_index] = 1 unless row_index >= 3
        @picture[row_index][column_index -1] = 1 unless column_index == 0
        @picture[row_index][column_index +1] = 1 unless column_index >= 3          
      end
      output_image
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

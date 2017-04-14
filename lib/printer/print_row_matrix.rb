class PrintRowMatrix
  # TODO FORMAT_STRING

  attr_reader :io, :row_matrix

  # TODO Extract method
  def initialize(attrs)
    @io         = attrs[:io] || STDOUT
    @row_matrix = attrs[:row_matrix]
  end

  def call
    row_matrix.row_size.times do |i|
      io.print '[ '

      row_matrix.column_size.times do |j|
        io.print row_matrix[i][j], ' '
      end

      io.puts ']'
    end
  end
end

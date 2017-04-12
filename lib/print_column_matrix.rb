class PrintColumnMatrix
  # TODO FORMAT_STRING

  attr_reader :io, :column_matrix

  # TODO Extract methods
  def initialize(attrs)
    @io            = attrs[:io] || STDOUT
    @column_matrix = attrs[:column_matrix]
  end

  # TODO
  def call
    column_matrix.row_size.times do |i|
      io.print '[ '

      column_matrix.column_size.times do |j|
        io.print column_matrix[j][i], ' '
      end

      io.puts ']'
    end
  end
end

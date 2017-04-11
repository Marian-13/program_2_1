module AdvancedMath
  class ColumnMatrix
    attr_reader :columns

    def initialize(attrs)
      @columns = attrs[:columns]
    end

    def row_size
      @row_size ||= columns[0].size
    end

    def column_size
      @column_size ||= columns.size
    end

    def [](index)
      columns[index]
    end

    def to_h
      { columns: columns }
    end
  end
end
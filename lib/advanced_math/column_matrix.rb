module AdvancedMath
  class ColumnMatrix < AbstractMatrix
    attr_reader :columns

    def initialize(columns = nil, **attrs_hash)
      @columns = columns || attrs_hash[:columns]
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

    def to_a
      columns
    end

    def to_h
      { columns: columns }
    end
  end
end

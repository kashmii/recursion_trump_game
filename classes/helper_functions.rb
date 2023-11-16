class HelperFunctions
  # 数字のリストを受け取り、最大値がある場所（インデックス）を返します
  def self.maxInArrayIndex(num_list)
    max_index, max_value = 0, num_list[0]

    # with_indexメソッドに引数を渡すと、その数値からインデックスのカウントを開始します
    num_list.each.with_index(1) do |num, i|
      if num > max_value
        max_index = i
        max_value = num
      end
    end
    max_index
  end
end
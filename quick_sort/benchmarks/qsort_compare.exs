to_sort = Unsorted.unsorted(1000000, 10000)

Benchee.run(%{
	"Concat" => fn -> Quicksort.qsort(to_sort) end,
	"List" => fn -> Quicksort2.qsort(to_sort) end
	})
alias Application

import InvestoreProducts.Factory
alias InvestoreProducts.{Product, Repo}

{:ok, _} = Application.ensure_all_started(:investore_products)

Repo.delete_all(Product)

insert_list(30, :product, %{})

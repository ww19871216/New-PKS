function product = getProductForSimulation_HUB

products = getAvailableProducts_HUB;

preamble=('Which product do you choose?');
nCategories=length(products);
categories=products;

answer=getUserAnswerForOptions(categories,nCategories,preamble);
product=categories{answer};
disp(['Okay you have chosen ' product '.'])
disp(' ')

end


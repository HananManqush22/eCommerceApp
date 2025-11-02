const String baseUrl = 'https://bnxlzlfbzbhmsbdsotyv.supabase.co/rest/v1/';
const String productData =
    'products_table?select=*,favorite_table(*),purchase_table(*)';
const String rateProduct = 'rates_table?select=*&for_product=eq.';
String updateOrPostRateEndPoint(String productId, String userId) {
  return 'rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId';
}

const commentsEndPoint = 'comments_table';

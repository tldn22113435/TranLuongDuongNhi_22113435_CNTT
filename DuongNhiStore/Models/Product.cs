namespace DuongNhiStore.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }

        public int? CategoryId { get; set; }
        public int? Price { get; set; } = 0;
        public float Discount { get; set; } = 0; 
        public Category? Category { get; set; }
        public ICollection<OrderProduct>? OrderProducts { get; set; }

        public int DiscountedPrice => (int)(Price * (1 - Discount));// Tính giá đã giảm
    }
}

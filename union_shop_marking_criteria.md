# Union Shop - Marking Criteria Table

## Functionality Requirements Sorted by Difficulty

| Feature | Description | Marks (%) | Reference |
|---------|-------------|-----------|-----------|
| **Basic (38%)** |
| Static Homepage | Homepage layout and widgets with static content (hardcoded data acceptable, it does not have to be responsive so aim for mobile view) | 5% | [Homepage](https://shop.upsu.net/) |
| Static Navbar | Top navigation bar with menu (the links do not have to work at this stage, it does not have to be responsive either so aim for mobile view) | 5% | [Homepage](https://shop.upsu.net/) |
| About Us Page | Static about us page with company information (a separate page to the home page) | 4% | [About Us](https://shop.upsu.net/pages/about-us) |
| Footer | Footer with dummy links and other information present in at least one of your pages | 3% | [Homepage](https://shop.upsu.net/) |
| Dummy collections page | A separate page displaying various collections of products(hardcoded dummy data acceptable) | 3% | [Collections](https://shop.upsu.net/collections/) |
| Dummy collection page | At least one separate page displaying all the products within one collection including the relevant dropdowns and filters (hardcoded dummy data acceptable, the widgets do not have to function at this stage) | 5% | [Collection Example](https://shop.upsu.net/collections/clothing-2) |
| Dummy product | At least one separate product page showing details and images of a product alongside the relevant dropdowns, buttons and other widgets (hardcoded dummy data acceptable, , the widgets do not have to function at this stage) | 5% | [Product Exmple](https://shop.upsu.net/collections/clothing-2/products/classic-hoodie) |
| Sale Collection | A separate page showing the products on sale with their discounted prices and other relevant widgets and promotional messaging (hardcoded dummy data acceptable, the widgets do not have to function at this stage) | 4% | [Sale Items](https://shop.upsu.net/collections/sale-items) |
| Authentication UI | A separate page for login/signup (the widgets do not have to function at this stage) | 4% | [Sign In](https://shop.upsu.net/account/login) |
| **Intermediate (34%)** |
| Dynamic Collections | The collections page shoudl now be dynamically populated from data models or services. The sorting, filtering, pagination and other widgets must function also.  | 5% | [Collections](https://shop.upsu.net/collections/) |
| Dynamic Product Listings | The page listing products for each collection should now be populated from data models or services. The sorting, filtering, pagination and other widgets must function also. | 8% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Individual Product Pages | The images and information on individual product pages populated from data models or services. All the widgets (e.g., the dropdowns and counters) must also function based on the data/services. (The add to cart/buy buttons do not have to work yet.) | 8% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Shopping cart | The ability to add items to cart, view the cart in a separate page, and all the relevant cart functionality (the checkout buttons should place the order without handling real monetary transactions) | 10% | [Cart](https://shop.upsu.net/cart) |
| Print Shack | Implement [the text-personalistion page](https://shop.upsu.net/products/personalise-text) in addition to [the associated about page](https://shop.upsu.net/pages/personalisation). The displayed form must dynamically updated based on the selected fields. | 3% | [Personalisation](https://shop.upsu.net/products/personalise-text) |
| **Advanced (25% total)** |
| Authentication system | Full user authentication and account management (you can implement this with other externatl authentications, not just Shop). Try signing up with the website and view the account dashboard to gather the full list of functionalities. | 8% | [Account](https://shopify.com/22645997643/account/orders) |
| Cart Management | Full cart functionality - quantity editing, removal, calculations, persistence | 6% | [Cart](https://shop.upsu.net/cart) |
| Search System | Complete search functionality (the search button should also be available from both the navbar and the footer). | 4% | [Search](https://shop.upsu.net/search) |

## Additional Considerations

### Bonus Features (Not required but can earn extra credit)
- Pagination on collection pages
- Social sharing buttons
- Email newsletter signup
- Size guide functionality
- Order notes in cart
- Mobile hamburger menu
- Cart badge with item count

### Technical Implementation Notes
- Focus on functionality over visual design
- External integrations (Shopify auth, payment systems) not required
- **Basic Level**: Hardcoded data* acceptable for collections and products
- **Intermediate Level**: UI implementation focus, data can be simulated
- **Advanced Level**: Full functionality with proper data management and state handling

### Terminology
**Hardcoded data*** = Data that is written directly into your Flutter code. These are fixed values rather than data loaded from external sources like APIs, databases, or other services.

**Dummy data** = Data that is often hardcoded or (AI) generated for display or testing purposes. It's not meant to represent real-world data stored in your services.

**Responsive** = Design that adapts to different screen sizes for example different layouts on mobile and desktop targets. For the purpose of this coursework, you are primarily developing a web application on mobile view.

### Mark Distribution Summary
- **Basic (30%)**: Essential pages, navigation, static content (hardcoded data* acceptable)
- **Intermediate (45%)**: Core e-commerce UI and dynamic content from data models/services
- **Advanced (25%)**: Complete systems with full functionality and data management

**Total: 100%**
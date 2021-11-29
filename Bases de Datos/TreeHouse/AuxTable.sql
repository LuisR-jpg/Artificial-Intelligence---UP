-- Auxiliar Table

create table CategoriaSabor 
(
	ID int primary key identity(1, 1), 
	Categoria nvarchar(50), 
	Sabor nvarchar(50)
)
insert into CategoriaSabor (Categoria, Sabor) values ('Smoothies','Fresa'), ('Smoothies','Mango'), ('Smoothies','Frutos rojos'), ('Smoothies','Pl�tano'), ('Smoothies','Sand�a'), ('Smoothies','Mel�n'), ('Chamoyada','Fresa'), ('Chamoyada','Mango'), ('Jugo','Verde'), ('Jugo','Antigripal'), ('Jugo','Energ�tico'), ('Jugo','Tropical'), ('Jugo','Orange'), ('Licuado','Fresa'), ('Licuado','Mango'), ('Licuado','Pl�tano'), ('Licuado','Fruta de la Temporada'), ('Fruta','Suprema con miel'), ('Fruta','con yogurt'), ('Fruta','con lim�n'), ('Fruta','entera'), ('Galleta','Ch�a'), ('Galleta','Avena'), ('Agua','Sand�a con menta'), ('Agua','Pi�a naranja'), ('Agua','Pepino con ch�a'), ('Agua','Apio con lim�n'), ('Ensalada','Tree-Tuna Salad'), ('Ensalada','Tree-Ham Cheese Salad'), ('Ensalada','Tree-Green Salad'), ('Ensalada','Tree-Fruit Salad'), ('Ensalada','Peras con Salami Salad'), ('Baguette','Ham Cheese Gouda'), ('Baguette','Tuna Cheese Gouda'), ('Baguette','Chicken Cheese Gouda'), ('Baguette','Serrano'), ('Panini','Green'), ('Panini','Crimimi'), ('Panini','Salami'), ('Ciabatta','Jam�n'), ('Ciabatta','At�n'), ('Sandwich','Jam�n'), ('Sandwich','At�n'), ('Tortas','Jam�n'), ('Tortas','Pollo'), ('Bagel','Queso Crema con frutos'), ('Bagel','Crema de cacao'), ('Bagel','Crema de cacahuate'), ('Bagel','Jam�n de pavo'), ('Bagel','Jam�n de pierna'), ('Bagel','Pechuga de pollo'), ('Bagel','Pepperoni'), ('Bagel','Veggie')
select * from CategoriaSabor
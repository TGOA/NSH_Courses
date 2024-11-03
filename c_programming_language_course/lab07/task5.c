#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int bookID;
    char title[100];
    char author[50];
    int year;
    float price;
} Book;

Book books[100];
int N = 0;

void loadBookData() {
    FILE *file = fopen("books.dat", "rb");
    if (file == NULL) {
        return;
    }
    fread(&N, sizeof(int), 1, file);
    fread(books, sizeof(Book), N, file);
    fclose(file);
}

void saveBookData() {
    FILE *file = fopen("books.dat", "wb");
    if (file == NULL) {
        printf("Error saving data!\n");
        return;
    }
    fwrite(&N, sizeof(int), 1, file);
    fwrite(books, sizeof(Book), N, file);
    fclose(file);
}

void inputBookData() {
    if (N >= 100) {
        printf("No more space for new books.\n");
        return;
    }

    printf("Enter book ID: ");
    scanf("%d", &books[N].bookID);
    getchar();

    printf("Enter book title: ");
    fgets(books[N].title, 100, stdin);
    strtok(books[N].title, "\n");

    printf("Enter author name: ");
    fgets(books[N].author, 50, stdin);
    strtok(books[N].author, "\n");

    printf("Enter publication year: ");
    scanf("%d", &books[N].year);

    printf("Enter price (SAR): ");
    scanf("%f", &books[N].price);

    N++;
    saveBookData();
    printf("Book added!\n");
}

void displayBookData() {
    if (N == 0) {
        printf("No books found.\n");
        return;
    }
    for (int i = 0; i < N; i++) {
        printf("Book ID: %d\n", books[i].bookID);
        printf("Title: %s\n", books[i].title);
        printf("Author: %s\n", books[i].author);
        printf("Year: %d\n", books[i].year);
        printf("Price: %.2f SAR\n", books[i].price);
        printf("----------------------\n");
    }
}

void findBookByID() {
    int id;
    printf("Enter book ID to search: ");
    scanf("%d", &id);

    for (int i = 0; i < N; i++) {
        if (books[i].bookID == id) {
            printf("Book found:\n");
            printf("Book ID: %d\n", books[i].bookID);
            printf("Title: %s\n", books[i].title);
            printf("Author: %s\n", books[i].author);
            printf("Year: %d\n", books[i].year);
            printf("Price: %.2f SAR\n", books[i].price);
            return;
        }
    }
    printf("Book not found.\n");
}

void calculateTotalValue() {
    float totalValue = 0;
    for (int i = 0; i < N; i++) {
        totalValue += books[i].price;
    }
    printf("Total value of books: %.2f SAR\n", totalValue);
}

int main() {
    loadBookData();

    int choice;
    do {
        printf("\nLibrary Menu\n");
        printf("1. Add book\n");
        printf("2. Show all books\n");
        printf("3. Search book by ID\n");
        printf("4. Total value of books\n");
        printf("5. Exit\n");
        printf("Choose: ");
        scanf("%d", &choice);
        getchar();

        if (choice == 1) {
            inputBookData();
        } else if (choice == 2) {
            displayBookData();
        } else if (choice == 3) {
            findBookByID();
        } else if (choice == 4) {
            calculateTotalValue();
        } else if (choice == 5) {
            printf("Goodbye!\n");
        } else {
            printf("Invalid choice, try again.\n");
        }
    } while (choice != 5);

    return 0;
}

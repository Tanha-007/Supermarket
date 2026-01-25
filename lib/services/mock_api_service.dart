// This is a placeholder for API service
// Using mock data in providers instead for offline functionality

class MockApiService {
  static final MockApiService _instance = MockApiService._internal();

  factory MockApiService() {
    return _instance;
  }

  MockApiService._internal();

  // Mock API endpoints would go here
  // Since we're using providers with mock data, this serves as documentation
  // of what would be called in a real implementation

  // Authentication endpoints
  // POST /auth/login
  // POST /auth/signup
  // POST /auth/logout
  // POST /auth/verify-nid

  // User endpoints
  // GET /users/{id}
  // PUT /users/{id}
  // DELETE /users/{id}

  // House endpoints
  // GET /houses
  // GET /houses/{id}
  // POST /houses
  // PUT /houses/{id}
  // DELETE /houses/{id}
  // GET /houses/search

  // Service endpoints
  // GET /services
  // GET /services/{id}
  // POST /services
  // PUT /services/{id}
  // DELETE /services/{id}
  // GET /services/search

  // Tuition endpoints
  // GET /tuitions
  // GET /tuitions/{id}
  // POST /tuitions
  // PUT /tuitions/{id}
  // DELETE /tuitions/{id}
  // GET /tuitions/search

  // Booking endpoints
  // GET /bookings
  // GET /bookings/{id}
  // POST /bookings
  // PUT /bookings/{id}
  // DELETE /bookings/{id}

  // Chat endpoints
  // GET /chat/{conversationId}
  // POST /chat/send
  // PUT /chat/{messageId}/read

  // Review endpoints
  // GET /reviews/{itemId}
  // POST /reviews
  // PUT /reviews/{id}
  // DELETE /reviews/{id}
}

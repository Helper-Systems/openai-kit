public struct EmbeddingProvider {
    
    private let requestHandler: RequestHandler
    
    init(requestHandler: RequestHandler) {
        self.requestHandler = requestHandler
    }

    /**
     Create embeddings
     POST

     https://api.openai.com/v1/embeddings

     Creates an embedding vector representing the input text.
     */
    public func create(
        model: String = Model.GPT3.textEmbeddingAda002.rawValue,
        input: [String],
        user: String? = nil
    ) async throws -> CreateEmbeddingResponse {

        let request = try CreateEmbeddingRequest(
            model: model,
            input: input,
            user: user
        )

        return try await requestHandler.perform(request: request)
    }


    /**
     Create embeddings
     POST

     https://api.openai.com/v1/embeddings

     Creates an embedding vector representing the input text.
     */
    public func create(
        model: String = Model.GPT3.textEmbeddingAda002.rawValue,
        input: String,
        user: String? = nil
    ) async throws -> CreateEmbeddingResponse {
        try await create(model: model, input: [input], user: user)
    }
}

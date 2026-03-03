/// The `Schema` object allows the definition of input and output data types.
///
/// These types can be objects, but also primitives and arrays.
/// Represents a select subset of an [OpenAPI 3.0 schema object](<https://spec.openapis.org/oas/v3.0.3#schema>).
///
/// <https://ai.google.dev/api/caching#Schema>
public struct Schema: Codable, Sendable {
    /// Data type.
    public let type: SchemaType
    /// The format of the data.
    ///
    /// Any value is allowed, but most do not trigger any special functionality.
    public let format: String?
    /// The title of the schema.
    public let title: String?
    /// A brief description of the parameter.
    ///
    /// This could contain examples of use. Parameter description may be formatted as Markdown.
    public let description: String?
    /// Indicates if the value may be null.
    public let nullable: Bool?
    /// Possible values of the element of ``SchemaType/string`` with enum format.
    ///
    /// For example we can define an Enum Direction as: `{type:STRING, format:enum, enum:["EAST", "NORTH", "SOUTH", "WEST"]}`
    public let `enum`: [String]?
    /// Maximum number of the elements for ``SchemaType/array``.
    ///
    /// `Int64`
    public let maxItems: String?
    /// Minimum number of the elements for ``SchemaType/array``.
    ///
    /// `Int64`
    public let minItems: String?
    /// Properties of ``SchemaType/object``.
    ///
    /// An object containing a list of `"key": value` pairs.
    /// Example: `{ "name": "wrench", "mass": "1.3kg", "count": "3" }`.
    public let properties: [String: Schema]?
    /// Required properties of ``SchemaType/object``.
    public let required: [String]?
    /// Minimum number of the properties for ``SchemaType/object``.
    ///
    /// `Int64`
    public let minProperties: String?
    /// Maximum number of the properties for ``SchemaType/object``.
    ///
    /// `Int64`
    public let maxProperties: String?
    /// Minimum length of the ``SchemaType/string``.
    ///
    /// `Int64`
    public let minLength: String?
    /// Maximum length of the ``SchemaType/string``.
    ///
    /// `Int64`
    public let maxLength: String?
    /// Pattern of the ``SchemaType/string`` to restrict a string to a regular expression.
    public let pattern: String?
    /// Example of the object.
    ///
    /// Will only populated when the object is the root.
    public let example: Protobuf.Value?
    /// The value should be validated against any (one or more) of the subschemas in the list.
    public let anyOf: [Schema]?
    /// The order of the properties. Not a standard field in open api spec. Used to determine the order of the properties in the response.
    public let propertyOrdering: [String]?
    
    /*
     * field omitted: "default" (not helpful in this context)
     */
    
    /// Schema of the elements of ``SchemaType/array``.
    public let items: IndirectOptional<Schema>
    /// Minimum value of the ``SchemaType/integer`` and ``SchemaType/number``
    public let minimum: Double?
    /// Maximum value of the ``SchemaType/integer`` and ``SchemaType/number``
    public let maximum: Double?
    
    public init(
        type: SchemaType, format: String? = nil,
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        `enum`: [String]? = nil,
        maxItems: String? = nil, minItems: String? = nil,
        properties: [String: Schema]? = nil, required: [String]? = nil,
        minProperties: String? = nil, maxProperties: String? = nil,
        minLength: String? = nil, maxLength: String? = nil,
        pattern: String? = nil, example: Protobuf.Value? = nil,
        anyOf: [Schema]? = nil, propertyOrdering: [String]? = nil, items: Schema? = nil,
        minimum: Double? = nil, maximum: Double? = nil
    ) {
        self.type = type
        self.format = format
        self.title = title
        self.description = description
        self.nullable = nullable
        self.enum = `enum`
        self.maxItems = maxItems
        self.minItems = minItems
        self.properties = properties
        self.required = required
        self.minProperties = minProperties
        self.maxProperties = maxProperties
        self.minLength = minLength
        self.maxLength = maxLength
        self.pattern = pattern
        self.example = example
        self.anyOf = anyOf
        self.propertyOrdering = propertyOrdering
        self.items = .init(swiftOptional: items)
        self.minimum = minimum
        self.maximum = maximum
    }
}

/// Type contains the list of OpenAPI data types as defined by <https://spec.openapis.org/oas/v3.0.3#data-types>
///
/// <https://ai.google.dev/api/caching#Type>
public enum SchemaType: String, Codable, Sendable {
    /// Not specified, should not be used.
    case unspecified = "TYPE_UNSPECIFIED"
    /// String type.
    case string = "STRING"
    /// Number type.
    case number = "NUMBER"
    /// Integer type.
    case integer = "INTEGER"
    /// Boolean type.
    case boolean = "BOOLEAN"
    /// Array type.
    case array = "ARRAY"
    /// Object type.
    case object = "OBJECT"
    /// Null type.
    case null = "NULL"
}

extension Schema {
    public static func string(
        format: String? = nil,
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        `enum`: [String]? = nil,
        minLength: String? = nil, maxLength: String? = nil,
        pattern: String? = nil,
        example: Protobuf.Value? = nil
    ) -> Self {
        .init(
            type: .string,
            format: format,
            title: title, description: description,
            nullable: nullable,
            enum: `enum`,
            minLength: minLength, maxLength: maxLength,
            pattern: pattern,
            example: example
        )
    }
    
    public static func number(
        format: String? = nil,
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        example: Protobuf.Value? = nil,
        minimum: Double? = nil, maximum: Double? = nil
    ) -> Self {
        .init(
            type: .number,
            format: format,
            title: title, description: description,
            nullable: nullable,
            example: example,
            minimum: minimum, maximum: maximum
        )
    }
    
    public static func integer(
        format: String? = nil,
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        example: Protobuf.Value? = nil,
        minimum: Double? = nil, maximum: Double? = nil
    ) -> Self {
        .init(
            type: .integer,
            format: format,
            title: title, description: description,
            nullable: nullable,
            example: example,
            minimum: minimum, maximum: maximum
        )
    }
    
    public static func boolean(
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        example: Protobuf.Value? = nil
    ) -> Self {
        .init(
            type: .boolean,
            title: title, description: description,
            nullable: nullable,
            example: example
        )
    }
    
    public static func array(
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        maxItems: String? = nil, minItems: String? = nil,
        example: Protobuf.Value? = nil,
        items: Schema? = nil
    ) -> Self {
        .init(
            type: .array,
            title: title, description: description,
            nullable: nullable,
            maxItems: maxItems, minItems: minItems,
            example: example,
            items: items
        )
    }
    
    public static func object(
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        properties: [String: Schema]? = nil, required: [String]? = nil,
        minProperties: String? = nil, maxProperties: String? = nil,
        example: Protobuf.Value? = nil,
        propertyOrdering: [String]? = nil
    ) -> Self {
        .init(
            type: .object,
            title: title, description: description,
            nullable: nullable,
            properties: properties, required: required,
            minProperties: minProperties, maxProperties: maxProperties,
            example: example,
            propertyOrdering: propertyOrdering
        )
    }
    
    public static func anyOf(
        title: String? = nil, description: String? = nil,
        nullable: Bool? = nil,
        example: Protobuf.Value? = nil,
        schemas: [Schema]
    ) -> Self {
        .init(
            type: .unspecified,
            title: title, description: description,
            nullable: nullable,
            example: example,
            anyOf: schemas
        )
    }
}

// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class VideosQuery: GraphQLQuery {
  public static let operationName: String = "Videos"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Videos($after: String, $first: Int, $year: Int) { videos(after: $after, first: $first, year: $year) { __typename edges { __typename cursor node { __typename dataId id slug thumbnails { __typename height url width } title } } pageInfo { __typename hasNextPage hasPreviousPage } } }"#
    ))

  public var after: GraphQLNullable<String>
  public var first: GraphQLNullable<Int>
  public var year: GraphQLNullable<Int>

  public init(
    after: GraphQLNullable<String>,
    first: GraphQLNullable<Int>,
    year: GraphQLNullable<Int>
  ) {
    self.after = after
    self.first = first
    self.year = year
  }

  public var __variables: Variables? { [
    "after": after,
    "first": first,
    "year": year
  ] }

  public struct Data: HighForThisAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("videos", Videos?.self, arguments: [
        "after": .variable("after"),
        "first": .variable("first"),
        "year": .variable("year")
      ]),
    ] }

    public var videos: Videos? { __data["videos"] }

    /// Videos
    ///
    /// Parent Type: `VideoConnection`
    public struct Videos: HighForThisAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.VideoConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
        .field("pageInfo", PageInfo.self),
      ] }

      public var edges: [Edge] { __data["edges"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }

      /// Videos.Edge
      ///
      /// Parent Type: `VideoEdge`
      public struct Edge: HighForThisAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.VideoEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cursor", String.self),
          .field("node", Node.self),
        ] }

        public var cursor: String { __data["cursor"] }
        public var node: Node { __data["node"] }

        /// Videos.Edge.Node
        ///
        /// Parent Type: `Video`
        public struct Node: HighForThisAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.Video }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("dataId", String.self),
            .field("id", HighForThisAPI.ObjID.self),
            .field("slug", String.self),
            .field("thumbnails", [Thumbnail].self),
            .field("title", String.self),
          ] }

          public var dataId: String { __data["dataId"] }
          public var id: HighForThisAPI.ObjID { __data["id"] }
          public var slug: String { __data["slug"] }
          public var thumbnails: [Thumbnail] { __data["thumbnails"] }
          public var title: String { __data["title"] }

          /// Videos.Edge.Node.Thumbnail
          ///
          /// Parent Type: `VideoThumbnail`
          public struct Thumbnail: HighForThisAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.VideoThumbnail }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("height", Int.self),
              .field("url", String.self),
              .field("width", Int.self),
            ] }

            public var height: Int { __data["height"] }
            public var url: String { __data["url"] }
            public var width: Int { __data["width"] }
          }
        }
      }

      /// Videos.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: HighForThisAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasNextPage", Bool?.self),
          .field("hasPreviousPage", Bool?.self),
        ] }

        public var hasNextPage: Bool? { __data["hasNextPage"] }
        public var hasPreviousPage: Bool? { __data["hasPreviousPage"] }
      }
    }
  }
}

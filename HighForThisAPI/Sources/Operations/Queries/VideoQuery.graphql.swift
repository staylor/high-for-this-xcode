// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class VideoQuery: GraphQLQuery {
  public static let operationName: String = "Video"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Video($slug: String!) { video(slug: $slug) { __typename dataId id slug thumbnails { __typename height url width } title } }"#
    ))

  public var slug: String

  public init(slug: String) {
    self.slug = slug
  }

  public var __variables: Variables? { ["slug": slug] }

  public struct Data: HighForThisAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { HighForThisAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("video", Video?.self, arguments: ["slug": .variable("slug")]),
    ] }

    public var video: Video? { __data["video"] }

    /// Video
    ///
    /// Parent Type: `Video`
    public struct Video: HighForThisAPI.SelectionSet {
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

      /// Video.Thumbnail
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
}

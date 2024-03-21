// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == HighForThisAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == HighForThisAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == HighForThisAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == HighForThisAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return HighForThisAPI.Objects.Query
    case "Podcast": return HighForThisAPI.Objects.Podcast
    case "AudioUpload": return HighForThisAPI.Objects.AudioUpload
    case "FileUpload": return HighForThisAPI.Objects.FileUpload
    case "ImageUpload": return HighForThisAPI.Objects.ImageUpload
    case "VideoUpload": return HighForThisAPI.Objects.VideoUpload
    case "Artist": return HighForThisAPI.Objects.Artist
    case "Category": return HighForThisAPI.Objects.Category
    case "CrossStreet": return HighForThisAPI.Objects.CrossStreet
    case "Neighborhood": return HighForThisAPI.Objects.Neighborhood
    case "Place": return HighForThisAPI.Objects.Place
    case "Venue": return HighForThisAPI.Objects.Venue
    case "VenueCoordinates": return HighForThisAPI.Objects.VenueCoordinates
    case "ShowConnection": return HighForThisAPI.Objects.ShowConnection
    case "ShowEdge": return HighForThisAPI.Objects.ShowEdge
    case "Show": return HighForThisAPI.Objects.Show
    case "AppleMusicData": return HighForThisAPI.Objects.AppleMusicData
    case "AppleMusicArtwork": return HighForThisAPI.Objects.AppleMusicArtwork
    case "PodcastConnection": return HighForThisAPI.Objects.PodcastConnection
    case "PodcastEdge": return HighForThisAPI.Objects.PodcastEdge
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
